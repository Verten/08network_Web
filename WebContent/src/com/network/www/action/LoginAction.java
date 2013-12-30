package com.network.www.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.network.www.app.AutoLogin;
import com.network.www.dao.impl.LoginImpl;
import com.network.www.util.ChangeToMD5;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware {
	private String usernametext;
	private String passwordtext;
	private String autologin;
	private Map<String, Object> session = null;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private LoginImpl login = new LoginImpl();

	public String getUsernametext() {
		return usernametext;
	}

	public void setUsernametext(String usernametext) {
		this.usernametext = usernametext;
	}

	public String getPasswordtext() {
		return passwordtext;
	}

	public void setPasswordtext(String passwordtext) {
		this.passwordtext = passwordtext;
	}

	public void setAutologin(String autologin) {
		this.autologin = autologin;
	}

	@Override
	public void setSession(Map<String, Object> seeeion) {
		this.session = seeeion;
	}
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String loginIn() {
		String md5password = ChangeToMD5.getMD5Info(passwordtext);
		if (login.LoginIn(usernametext, md5password)) {
			if ("true".equals(autologin)) {
				// 用户勾选了自动登录
				System.out.println("自动登录");
				AutoLogin.saveCookie(response, request, usernametext, md5password);
			}
			// 存放到seeeion里面去
			session.put("user", usernametext);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String loginOut() {
		if (session != null) {
			session.remove("user");
			return SUCCESS;
		}
		return INPUT;
	}

}
