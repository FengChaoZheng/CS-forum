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
import com.forum.util.DateToString;

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
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String userName = request.getParameter("username");
		System.out.println("接收注册页面用户名："+ userName);
		String userSex = request.getParameter("sex");
		System.out.println("接收注册页面用户性别："+userSex);
		String userPassword = request.getParameter("password");
		System.out.println("接收注册页面用户密码："+ userPassword);
		String userEmail = request.getParameter("email");
		System.out.println("接收注册页面用户邮箱："+ userEmail);
		String userAuthority = request.getParameter("authority");
		System.out.println("接收注册页面默认权："+ userAuthority);
		
		if("普通会员".equals(userAuthority)){
			System.out.println("注册-----普通会员-----------");
			user.setName(userName);
			user.setSex(userSex);
			user.setPassword(userPassword);
			user.setEmail(userEmail);
			user.setAuthority(userAuthority);
			String time = DateToString.strTimeCurrent();
			user.setLastTime(time);
			ud.create(user);
			//选择下一个页面
			ModelAndView mav = new ModelAndView();
			//添加模型数据  可以是任意的POJO对象
            //mav.addObject("email",userEmail);
			//welcome.jsp页面可以接收到标记“email”，而welcome重定向之后就无法接收，所以此处使用session以便在整个会话期间都可以接收标记
			//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
			mav.setViewName("user/welcome");
			
			return mav;
		}else if("管理员".equals(userAuthority)){
			System.out.println("注册-----管理员-----------");
			user.setName(userName);
			user.setSex(userSex);
			user.setPassword(userPassword);
			user.setEmail(userEmail);
			user.setAuthority(userAuthority);
			Date date=new Date();
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=format.format(date);
			user.setLastTime(time);
			user = ud.create(user);
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			return new ModelAndView("redirect:/admin/jsp/adminIndex.jsp");
		}
		
		return new ModelAndView("redirect:/user/register.jsp");
	}

}
