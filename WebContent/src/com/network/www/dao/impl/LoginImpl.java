package com.network.www.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.network.www.dao.inf.LoginInf;
import com.network.www.util.JDBCUtil;
import com.network.www.util.LogUtil;


public class LoginImpl implements LoginInf {
	
	@Override
	public boolean LoginIn(String username, String password) {
		Connection conn = JDBCUtil.getConn();
		String SQL = "select * from network_user where username=?";
		try {
			PreparedStatement ppst = conn.prepareStatement(SQL);
			ppst.setString(1, username);
			ResultSet rs = ppst.executeQuery();
			while(rs.next()){
				String passwordInDB = rs.getString("password");
				if(password.equals(passwordInDB)){
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LogUtil.logInfo(LoginImpl.class.getName(),"error", "Error in create SQL");
		} catch (Exception e1) {
			LogUtil.logInfo(LoginImpl.class.getName(),"error", "Error in LoginIn");
		}
		return false;
	}

	@Override
	public boolean SignUp(String username, String password) {
		// TODO Auto-generated method stub
		return false;
	}

}
