package com.network.www.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	private static String username = "root";
	private static String password = "19905018";
	private static String url = "jdbc:mysql://localhost:3306/08network";
	private static Connection conn = null;
	//private static Log log;
	
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			LogUtil.logInfo(JDBCUtil.class.getName(), "error", "Error in load class for mysql...");
		}
	}
	
	public static Connection getConn(){
		if(conn != null){
			return conn;
		}
		try {
			conn = DriverManager.getConnection(url, username, password);
			conn.setAutoCommit(false);
			return conn;
		} catch (SQLException e) {
			LogUtil.logInfo(JDBCUtil.class.getName(), "error", "Error in create connection." + e.toString());
			return null;
		}
		//return null;
	}
	
//	public static Connection getConn() {
//		if (conn != null) {
//			return conn;
//		}
//		try {
//			InitialContext ctx = new InitialContext();
//			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mydb");
//			conn = ds.getConnection();
//			conn.setAutoCommit(false);
//			return conn;
//		} catch (SQLException e) {
//			LogUtil.logInfo(JDBCUtil.class.getName(), "error",
//					"Error in create connection." + e.toString());
//			return null;
//		}
//		// return null;
//		catch (NamingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	public static void close(){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				LogUtil.logInfo(JDBCUtil.class.getName(), "error", "Error in close connection.");
			}
		}
	}
}
