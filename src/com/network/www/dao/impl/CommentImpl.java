package com.network.www.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.network.www.bean.NetworkComment;
import com.network.www.dao.inf.CommentInf;
import com.network.www.util.JDBCUtil;
import com.network.www.util.LogUtil;
import com.network.www.util.SystemUtil;

public class CommentImpl implements CommentInf {
    private String table_name = SystemUtil.CommentTable;
	@Override
	public boolean publishComment(NetworkComment comment) {
		int result = 0;
		Connection conn = JDBCUtil.getConn();
		String sql = "insert into "+ table_name +" (comment_user,comment_content,comment_date,blog_id) values (?,?,?,?)";
		PreparedStatement ppst = null;

		try {
			ppst = conn.prepareStatement(sql);
			ppst.setString(1, comment.getComment_user());
			ppst.setString(2, comment.getComment_content());
			ppst.setTimestamp(3, comment.getComment_date());
			ppst.setInt(4, comment.getBlog_id());
			result = ppst.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			LogUtil.logInfo(CommentImpl.class.getName(), "error",
					"some sql error in publish comment" + e.toString());
		} catch (Exception e) {
			LogUtil.logInfo(CommentImpl.class.getName(), "error",
					"error in publish comment" + e.toString());
		}
		if(result > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteComment(NetworkComment comment) {
		int result = 0;
		Connection conn = JDBCUtil.getConn();
		String sql = "delete from "+ table_name +" where id=?";
		PreparedStatement ppst = null;

		try {
			ppst = conn.prepareStatement(sql);
			ppst.setInt(1, comment.getId());
			result = ppst.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			LogUtil.logInfo(CommentImpl.class.getName(), "error",
					"some sql error in delete comment" + e.toString());
		}catch (Exception e) {
			LogUtil.logInfo(CommentImpl.class.getName(), "error",
					"error in delete comment" + e.toString());
		}
		if(result > 0){
			return true;
		}
		return false;
	}

}
