package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.UserDao;
import com.forum.model.User;
import com.forum.util.ConvertEncoding;

public class UserLoginController implements Controller {

	private UserDao ud;
	private User user;

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");

		String strValue = request.getParameter("value");
		int value = Integer.parseInt(strValue);

		String loginName = request.getParameter("loginName");
		System.out.println("处理登录接收的用户名：" + loginName);
		String loginPassword = ConvertEncoding.changeToUtf(request
				.getParameter("loginPassword"));
		System.out.println("处理登录接收的密码：" + loginPassword);

		String info = "";

		user.setName(loginName);
		user.setPassword(loginPassword);

		ModelAndView mav = new ModelAndView();

		switch (value) {
		case 0:
		case 1:
			if (ud.find(user) != null) {
				session.setAttribute("userId",user.getId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("userSex", user.getSex());
				session.setAttribute("userEmail", user.getEmail());
				session.setAttribute("userAuthority", user.getAuthority());
				session.setAttribute("userLastTime", user.getLastTime());
				mav.setViewName("redirect:/user/index.jsp");
			} else {
				System.out.println("+++++++++++++++++++++++++++++");
				info = "用户名或密码不正确，请重新输入";
				session.setAttribute("info", info);
				switch (value) {
				case 0:
					mav.setViewName("redirect:/user/index.jsp");
					break;
				case 1:
					mav.setViewName("redirect:/user/login.jsp");
					break;
				}
			}
			break;
		case 2:
			user.setAuthority("管理员");
			if (ud.findAdmin(user) != null) {
				session.setAttribute("userId",user.getId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("userSex", user.getSex());
				session.setAttribute("userEmail", user.getEmail());
				session.setAttribute("userAuthority", user.getAuthority());
				session.setAttribute("userLastTime", user.getLastTime());
				mav.setViewName("redirect:/admin/jsp/adminIndex.jsp");
			} else {
				System.out.println("+++++++++++++++++++++++++++++");
				info = "用户名或密码不正确，请重新输入";
				session.setAttribute("info", info);
				mav.setViewName("redirect:/admin/adminLogin.jsp");
			}
			break;
		}
		return mav;
	}

}
