package com.network.www.bean;

import java.io.Serializable;
import java.util.Date;

public class NetworkBlog implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String blog_title;
	private String blog_content;
	private String blog_user;
	private Date blog_date;
	private int blog_up_count;
	private int blog_down_count;
	private String remark;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBlog_title() {
		return blog_title;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	public String getBlog_content() {
		return blog_content;
	}

	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}

	public String getBlog_user() {
		return blog_user;
	}

	public void setBlog_user(String blog_user) {
		this.blog_user = blog_user;
	}

	public Date getBlog_date() {
		return blog_date;
	}

	public void setBlog_date(Date blog_date) {
		this.blog_date = blog_date;
	}

	public int getBlog_up_count() {
		return blog_up_count;
	}

	public void setBlog_up_count(int blog_up_count) {
		this.blog_up_count = blog_up_count;
	}

	public int getBlog_down_count() {
		return blog_down_count;
	}

	public void setBlog_down_count(int blog_down_count) {
		this.blog_down_count = blog_down_count;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
