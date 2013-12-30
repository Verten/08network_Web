package com.network.www.app;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.network.www.dao.impl.LoginImpl;

public class AutoLogin {
	// private int saveSeconds = 0;
	private static Cookie cookie;
	private static String username;
	private static String password;
	private static LoginImpl login = new LoginImpl();

	public static void saveCookie(ServletResponse response, ServletRequest request,String username,String password) {
		cookie = new Cookie("user", username+"@@"+password);
		cookie.setMaxAge(30*24*60*60);
		((HttpServletResponse) response).addCookie(cookie);
		((HttpServletRequest)request).getSession().setAttribute("user",username);
	}

	public static String loadCookie(ServletRequest request,
			ServletResponse response) {
		//boolean valid = false;
		Cookie[] cookies = ((HttpServletRequest)request).getCookies();
		for (Cookie cook : cookies) {
			System.out.println("cookie: " + cook.getName());
			String str = cook.getValue();
			String[] tmpstr = str.split("@@");
			if(tmpstr.length == 2){
				username = tmpstr[0];
				password = tmpstr[1];
				System.out.println(username+"+"+password);
			}
			if(login.LoginIn(username, password)){
				((HttpServletRequest)request).getSession().setAttribute("user",username);
				return username;
			}
			else{
				continue;
			}
		}
		return null;
	}
}
