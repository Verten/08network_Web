package com.network.www.action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.network.www.bean.NetworkBlog;
import com.network.www.dao.impl.BlogImpl;
import com.network.www.util.LogUtil;
import com.opensymphony.xwork2.ActionSupport;

public class BlogAction extends ActionSupport implements SessionAware,
ServletRequestAware, ServletResponseAware{

	private BlogImpl bi = new BlogImpl();
	private int blog_id;
	private Map<String, Object> session = new HashMap<String, Object>();
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String blog_title;
	private String blog_content;
	private String blog_user;
	private java.util.Date blog_date;
	private int upcount;
	private int downcount;
	
	
	
	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}
	@Override
	public void setServletResponse(HttpServletResponse respone) {
		this.response = respone;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}

	public void setBlog_user() {
		String username = (String)session.get("user");
		this.blog_user = username;
	}
	
	public String getBlog_user() {
		return blog_user;
	}
	
	public void setBlog_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String tempdate = sdf.format(new java.util.Date());
		java.util.Date date = null;
		try {
			date = sdf.parse(tempdate);
		} catch (ParseException e) {
			LogUtil.logInfo(BlogAction.class.getName(), "Error", "Error in set Blog_Date...");
		}
		this.blog_date = date;
	}

	public java.util.Date getBlog_date() {
		return blog_date;
	}

	public void setUpcount(int upcount) {
		this.upcount = upcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	
	public String upBlogCount(){
		boolean result = false;
		if(blog_id != 0){
			if(upcount != 0){
				result = bi.upMyBlog(blog_id, upcount);
			}
		}
		if(result == true){
			return SUCCESS;
		}else {
			return INPUT;
		}
	}
	
	public String downBlogCount(){
		boolean result = false;
		if(blog_id != 0){
			if(downcount != 0){
				result = bi.downMyBlog(blog_id, downcount);
			}
		}
		if(result == true){
			return SUCCESS;
		}else {
			return INPUT;
		}
	}
	
	public String publishBlog(){
		setBlog_date();
		setBlog_user();
		if(blog_user == null){
			return "nologin";
		}
		boolean result = false;
		NetworkBlog nb = new NetworkBlog();
		
		nb.setBlog_content(blog_content);
		nb.setBlog_date(blog_date);
		System.out.println("publish blog");
		nb.setBlog_user(blog_user);
		nb.setBlog_up_count(upcount);
		nb.setBlog_down_count(downcount);
		
		result = bi.publishBlog(nb);
		System.out.println(result);
		if(result == true){
			return SUCCESS;
		}
		return INPUT;
	}

}
