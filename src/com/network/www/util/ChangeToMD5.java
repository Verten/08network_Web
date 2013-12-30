package com.network.www.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ChangeToMD5 {
	public static String getMD5Info(String info){
		String tempstr = info;
			byte[] tempmail = tempstr.getBytes();
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
			        return sb.toString();
		    }  catch (NoSuchAlgorithmException e) {
		    	LogUtil.logInfo(ChangeToMD5.class.getName(), "error", "Error in getting MD5 information for: " + tempstr);
			}
				return null;
	}
}
