package com.network.www.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LogUtil {
	private static Log log;
	
	public static void logInfo(String ClassName,String method,Object obj){
		log = LogFactory.getLog(ClassName);
		if("error".equals(method)){
			log.error(obj);
		}
		if("warn".equals(method)){
			log.warn(obj);
		}
	}
}
