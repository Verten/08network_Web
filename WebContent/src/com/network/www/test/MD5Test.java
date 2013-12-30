package com.network.www.test;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.network.www.util.JDBCUtil;

public class MD5Test {
	public List<Long> genStudentNum(String start,String end){
		List<Long> NumList = new ArrayList<Long>();
		long tmpstart = Long.valueOf(start);
		long tmpend = Long.valueOf(end);
		for(long i = tmpstart;i<=tmpend;i ++){
			NumList.add(i);
		}
		if(NumList.size() > 0){
			return NumList;
		}
		return null;
	}
	
	public static String getMD5Info(String str) {
		byte[] tempmail = str.getBytes();
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
		     md.update(tempmail);
		     byte [] tmp = md.digest();
		     int j;
		        StringBuffer sb = new StringBuffer("");
		        for(int i = 0;i<tmp.length;i++){
		        	j = tmp[i];
		        	if(j < 0){
		        		j+=256;
		        	}
		        	if(j<16){
		        		sb.append("0");
		        	}
		            sb.append(Integer.toHexString(j&0xff));
		        }
		        //System.out.println(sb.toString());
		        return sb.toString();
		    }  catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
		    }
		    return null;
	}
	
	public static void main(String[] args) {
		MD5Test md5 = new MD5Test();
		Connection conn = JDBCUtil.getConn();
		PreparedStatement ppst = null;
		String sql = "insert into networkuser (username,password) values (?,?)";
		List<Long> numList = md5.genStudentNum("2008045143001", "2008045143040");
		for (Long long1 : numList) {
			//System.out.println(long1);
			String md5password = getMD5Info(String.valueOf(long1));
			try {
				ppst = conn.prepareStatement(sql);
				ppst.setString(1, String.valueOf(long1));
				ppst.setString(2, md5password);
				ppst.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
