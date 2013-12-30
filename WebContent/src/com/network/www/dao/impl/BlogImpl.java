package com.network.www.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.network.www.bean.NetworkBlog;
import com.network.www.dao.inf.BlogInf;
import com.network.www.util.JDBCUtil;
import com.network.www.util.LogUtil;

public class BlogImpl implements BlogInf {

	@Override
	public List<NetworkBlog> getAllBlog() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NetworkBlog> getMyBlog(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteMyBlog(int blog_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean publishBlog(NetworkBlog blog) {
		int result = 0;
		Connection conn = JDBCUtil.getConn();
		PreparedStatement ppst = null;
		String sql = "insert into network_blog (blog_title,blog_content,blog_user,blog_date,blog_up_count,blog_down_count) values(?,?,?,?,?,?)";
		try {
			ppst = conn.prepareStatement(sql);
			//use content to test
			ppst.setString(1, blog.getBlog_content());
			ppst.setString(2, blog.getBlog_content());
			ppst.setString(3, blog.getBlog_user());
			//java.util.Date cannot be cast to java.sql.Date
			ppst.setDate(4, new java.sql.Date(blog.getBlog_date().getTime()));
			ppst.setInt(5, blog.getBlog_up_count());
			ppst.setInt(6, blog.getBlog_down_count());
			result = ppst.executeUpdate();
			System.out.println(result);
			conn.commit();
		} catch (SQLException e) {
			LogUtil.logInfo(BlogImpl.class.getName(), "error",
					"some sql error in publish blog" + e.toString());
		} catch (Exception e) {
			LogUtil.logInfo(BlogImpl.class.getName(), "error",
					"error in publish blog" + e.toString());
		}
		if(result > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean upMyBlog(int blog_id, int upcount) {
		int result = 0;
		Connection conn = JDBCUtil.getConn();
		PreparedStatement ppst = null;
		String sql = "update network_blog set blog_up_count=? where id=?";
		try {
			ppst = conn.prepareStatement(sql);
			ppst.setInt(1, upcount);
			ppst.setInt(2, blog_id);
			result = ppst.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			LogUtil.logInfo(BlogImpl.class.getName(), "error", "error in update blog_up_count"+ e.toString());
		}catch (Exception e) {
			LogUtil.logInfo(BlogImpl.class.getName(), "error", "error in update blog_up_count");
		}
		if(result > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean downMyBlog(int blog_id, int downcount) {
		int result = 0;
		Connection conn = JDBCUtil.getConn();
		PreparedStatement ppst = null;
		String sql = "update network_blog set blog_down_count=? where id=?";
		try {
			ppst = conn.prepareStatement(sql);
			ppst.setInt(1, downcount);
			ppst.setInt(2, blog_id);
			result = ppst.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			LogUtil.logInfo(BlogImpl.class.getName(), "error", "error in update blog_down_count");
		} catch (Exception e) {
			LogUtil.logInfo(BlogImpl.class.getName(), "error", "error in update blog_down_count");
		}
		if(result > 0){
			return true;
		}
		return false;
	}

	@Override
	public List<NetworkBlog> getNewBlog() {
		// TODO Auto-generated method stub
		return null;
	}

}
