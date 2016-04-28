package com.forum.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		
		String loginName = request.getParameter("loginName");
		System.out.println("处理登录接收的用户名："+loginName);
		String loginPassword = ConvertEncoding.changeToUtf(request.getParameter("loginPassword"));
		System.out.println("处理登录接收的密码："+loginPassword);
		
		String info = "";
		
		user.setName(loginName);
		user.setPassword(loginPassword);
		
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		user.setLastTime(time);
		ud.updateDate(user);
		
		if (ud.find(user) != null) {
			session.setAttribute("userName",user.getName());
			session.setAttribute("userSex",user.getSex());
			session.setAttribute("userEmail",user.getEmail());
			session.setAttribute("userAuthority",user.getAuthority());
			session.setAttribute("userLastTime",user.getLastTime());
			return new ModelAndView("redirect:/user/index.jsp");
		} else {
			System.out.println("+++++++++++++++++++++++++++++");
			info = "用户名或密码不正确，请重新输入";
			session.setAttribute("info", info);
			return new ModelAndView("redirect:/user/index.jsp");
		}
	}

}
