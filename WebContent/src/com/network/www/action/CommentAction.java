package com.network.www.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.network.www.bean.NetworkComment;
import com.network.www.dao.impl.CommentImpl;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware {

	private int id;
	private String comment_user;
	private String comment_content;
	private Timestamp comment_date;
	private int blog_id;
	private CommentImpl ci = new CommentImpl();
	private Map<String, Object> session = new HashMap<String, Object>();
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}
	public String getComment_user() {
		return comment_user;
	}
	public void setComment_user() {
		String username = (String)session.get("user");
		this.comment_user = username;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date() {
		Date date = new Date();
		Timestamp time = new Timestamp(date.getTime());
		this.comment_date = time;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String publishComment(){
		setComment_user();
		setComment_date();
		if(comment_user == null){
			return "nologin";
		}
		boolean result = false;
		NetworkComment nc = new NetworkComment();
		if (comment_content != null && !"".equals(comment_content)
				&& comment_user != null && !"".equals(comment_user)
					&& blog_id != 0 && comment_date != null) {
			nc.setComment_user(comment_user);
			nc.setComment_content(comment_content);
			nc.setComment_date(comment_date);
			nc.setBlog_id(blog_id);
			result = ci.publishComment(nc);
		}else{
			return INPUT;
		}
		if(result == true){
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String deleteComment(){
		setComment_user();
		setComment_date();
		if(comment_user == null){
			return "nologin";
		}
		boolean result = false;
		NetworkComment nc = new NetworkComment();
		if(id != 0){
			nc.setId(id);
			result = ci.deleteComment(nc);
		}else{
			return INPUT;
		}
		if(result == true){
			return SUCCESS;
		}
		return INPUT;
	}

}
