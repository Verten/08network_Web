package com.network.www.app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.network.www.bean.NetworkBlog;
import com.network.www.util.JDBCUtil;
import com.network.www.util.LogUtil;

public class BlogUtil {

	private static Connection conn;

	public static List<NetworkBlog> getNewBlog() {
		ResultSet rs = null;
		NetworkBlog blog = null;
		List<NetworkBlog> bloglist = new ArrayList<NetworkBlog>();
		String sql = "select * from network_blog order by id desc";
		conn = JDBCUtil.getConn();
		PreparedStatement ppst;
		try {
			ppst = conn.prepareStatement(sql);
			rs = ppst.executeQuery();
			while (rs.next()) {
				int i = 0;
				blog = new NetworkBlog();
				blog.setId(rs.getInt(++i));
				blog.setBlog_title(rs.getString(++i));
				blog.setBlog_content(rs.getString(++i));
				blog.setBlog_user(rs.getString(++i));
				blog.setBlog_date(rs.getDate(++i));
				blog.setBlog_up_count(rs.getInt(++i));
				blog.setBlog_down_count(rs.getInt(++i));
				blog.setRemark(rs.getString(++i));
				bloglist.add(blog);
			}
		} catch (SQLException e) {
			LogUtil.logInfo(BlogUtil.class.getName(), "error",
					"Error in get the new Blogs...");
			return null;
		} catch(Exception e){
			LogUtil.logInfo(BlogUtil.class.getName(), "error",
					"Error in get the new Blogs...");
			return null;
		}
		return bloglist;
	}

}
