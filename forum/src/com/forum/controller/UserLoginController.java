package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.UserDao;
import com.forum.model.User;
import com.forum.util.ConvertEncoding;

public class UserLoginController implements Controller{
	
	private UserDao ud;
	private User user;
	public void setUd(UserDao ud){
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
		
		String loginEmail = ConvertEncoding.changeToUtf(request.getParameter("loginEmail"));
		System.out.println("处理登录接收的邮箱："+loginEmail);
		String loginPassword = ConvertEncoding.changeToUtf(request.getParameter("loginPassword"));
		System.out.println("处理登录接收的密码："+loginPassword);
		
		String info = "";
		
		user.setEmail(loginEmail);
		user.setPassword(loginPassword);
		
		if (ud.find(user)) {
			session.setAttribute("email",loginEmail);
			return new ModelAndView("redirect:/index.jsp");
		} else {
			info = "用户名或密码不正确，请重新输入";
			session.setAttribute("info", info);
			return new ModelAndView("redirect:/index.jsp");
		}
	}

}
