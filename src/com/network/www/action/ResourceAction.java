package com.network.www.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.network.www.bean.NetworkBlog;
import com.opensymphony.xwork2.ActionSupport;

public class ResourceAction extends ActionSupport implements SessionAware{
	private String filename;
	private String fileinfo;
	private File file;
	private Map<String,Object> session = new HashMap<String,Object>();
	private Timestamp time;
	private String deleteid;
	private String pageid;
	private boolean mysplit;
	int pagesize = 11;
	
	private String fileFileName;
	private String fileContentType;

	public boolean isMysplit() {
		return mysplit;
	}
	public void setMysplit(boolean mysplit) {
		this.mysplit = mysplit;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public String getPageid() {
		return pageid;
	}
	public void setPageid(String pageid) {
		this.pageid = pageid;
	}
	public void setDeleteid(String deleteid) {
		this.deleteid = deleteid;
	}
	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileinfo() {
		return fileinfo;
	}

	public void setFileinfo(String fileinfo) {
		this.fileinfo = fileinfo;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	public String splitResource(){
		List<NetworkBlog> templist = (List<NetworkBlog>) session.get("newBlogs");
		int count = templist.size();
		int flag = 0;
		int totalpage = (count + pagesize - 1)/pagesize;
		int toPage = 1;
		int temppageid = Integer.valueOf(pageid);
		if(temppageid == 0){
			toPage = 1;
			flag = 1; //第一页
		}else{
			try{
				toPage = temppageid;
			}catch (Exception e) {
				toPage = 1;
			}
		}
		if(toPage > totalpage){
			toPage = totalpage;
			flag = 2; //最后一页
		}
		int start = (toPage - 1)* pagesize;
		//System.out.println("��ʼλ��"+ start);
		//System.out.println("��ǰҳ��"+ toPage);
		int end = start +  pagesize;
		session.put("pagesize", pagesize);
		session.put("totalpage", totalpage);
		session.put("startid", start);
		session.put("endid", end);
		session.put("currentpage", toPage);
		session.put("mysplit", mysplit);
		System.out.println("splitsuccess");
		switch (flag) {
		case 0:
			return SUCCESS;
		case 1:
			return "firstPage";
		case 2:
			return "lastPage";
		}
		return SUCCESS;
	}
}
