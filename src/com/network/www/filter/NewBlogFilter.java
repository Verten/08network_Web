package com.network.www.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.network.www.app.BlogUtil;
import com.network.www.app.CommentUtil;
import com.network.www.bean.NetworkBlog;
import com.network.www.bean.NetworkComment;

/**
 * Servlet Filter implementation class NewBlogFilter
 */
public class NewBlogFilter implements Filter {

    /**
     * Default constructor. 
     */
    public NewBlogFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		int startid = 0;
		int endid = 0;
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		System.out.println("Loading the new Blogs...");
		List<NetworkBlog> bloglist = BlogUtil.getNewBlog();
		List<NetworkComment> commentlist = CommentUtil.getComments();
		session.setAttribute("newBlogs", bloglist);
		session.setAttribute("comments", commentlist);
		if(session.getAttribute("startid") != null){
			startid = (Integer)session.getAttribute("startid");
		}else{
			startid = 0;
		}
		if(session.getAttribute("endid") != null){
			endid = (Integer)session.getAttribute("endid");
		}else{
			endid = 10;
		}
		if(session.getAttribute("currentpage") == null){
			session.setAttribute("currentpage", 1);
		}
		session.setAttribute("startid", startid);
		session.setAttribute("endid", endid);
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
