package com.network.www.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.network.www.app.AutoLogin;

/**
 * Servlet Filter implementation class AutoLoginFilter
 */
public class AutoLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AutoLoginFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request1 = (HttpServletRequest) request;  
	     HttpServletResponse response1 = (HttpServletResponse) response;  
	     
	     System.out.println("验证自动登录"); 
	     String username = AutoLogin.loadCookie(request1, response1);
	     if(username != null){
	    	 System.out.println("获取成功");
	    	 request1.getSession().setAttribute("user",username);  
	         response1.sendRedirect("info/loginsuccess.jsp");
	    	 //request1.getRequestDispatcher("index.jsp").forward(request1, response1);
	     }else{
	    	 System.out.println("获取失败");
	    	 chain.doFilter(request, response);
	     }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
