package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.UserDao;
import com.forum.model.User;

public class UserRegisterController implements Controller{
	
	private UserDao ud;
	private User user;
	
	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	public void setUser(User user){
		this.user = user;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("username");
		System.out.println("接收页面数据："+ userName);
		String userPassword = request.getParameter("password");
		System.out.println("接收页面数据："+ userPassword);
		String userEmail = request.getParameter("email");
		System.out.println("接收页面数据："+ userEmail);
		
		session.setAttribute("email", userEmail);
		
		if(!"".equals(userName) && !"".equals(userPassword) && !"".equals(userEmail)){
			user.setName(userName);
			user.setPassword(userPassword);
			user.setEmail(userEmail);
			ud.create(user);
			//选择下一个页面
			ModelAndView mav = new ModelAndView();
			//添加模型数据  可以是任意的POJO对象
            //mav.addObject("email",userEmail);
			//welcome.jsp页面可以接收到标记“email”，而welcome重定向之后就无法接收，所以此处使用session以便在整个会话期间都可以接收标记
			//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
			mav.setViewName("welcome");
			
			return mav;
		}
		
		return new ModelAndView("redirect:/register.jsp");
	}

}
