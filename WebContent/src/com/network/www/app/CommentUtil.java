package com.network.www.app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.network.www.bean.NetworkBlog;
import com.network.www.bean.NetworkComment;
import com.network.www.util.JDBCUtil;
import com.network.www.util.LogUtil;

public class CommentUtil {

	private static Connection conn;

	public static List<NetworkComment> getComments() {
		ResultSet rs = null;
		NetworkComment comment = null;
		List<NetworkComment> commentlist = new ArrayList<NetworkComment>();
		String sql = "select * from network_comment order by id desc";
		conn = JDBCUtil.getConn();
		PreparedStatement ppst;
		try {
			ppst = conn.prepareStatement(sql);
			rs = ppst.executeQuery();
			while (rs.next()) {
				int i = 0;
				comment = new NetworkComment();
				comment.setId(rs.getInt(++i));
				comment.setComment_user(rs.getString(++i));
				comment.setComment_content(rs.getString(++i));
				comment.setComment_date(rs.getTimestamp(++i));
				comment.setBlog_id(rs.getInt(++i));
				comment.setRemark(rs.getString(++i));
				commentlist.add(comment);
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
		return commentlist;
	}

}
