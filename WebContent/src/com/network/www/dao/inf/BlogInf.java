package com.network.www.dao.inf;

import java.util.List;

import com.network.www.bean.NetworkBlog;

public interface BlogInf {
	List<NetworkBlog> getAllBlog();

	List<NetworkBlog> getMyBlog(String username);

	boolean deleteMyBlog(int blog_id);

	boolean publishBlog(NetworkBlog blog);

	boolean upMyBlog(int blog_id, int upcount);

	boolean downMyBlog(int blog_id, int downcount);
	
	List<NetworkBlog> getNewBlog();//will get some new blog for index.jsp to show
}
