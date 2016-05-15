package com.forum.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpSession session=((HttpServletRequest)request).getSession();
	    System.out.println("后台过滤器验证登录查看会话内容的管理员用户名："+session.getAttribute("adminName"));
	    if(session.getAttribute("adminName")==null)
	    {
	    	((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/admin/adminLogin.jsp");
	    }
	    else
	    {
	    	chain.doFilter(request, response);
	    }
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

}
