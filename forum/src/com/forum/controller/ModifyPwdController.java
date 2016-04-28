package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.UserDao;
import com.forum.model.User;

public class ModifyPwdController implements Controller{
	
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
        String userName = (String) session.getAttribute("userName");
        user.setName(userName);
        String password = request.getParameter("newpassword");
        user.setPassword(password);
        
        ud.updatePassword(user);
        
        session.removeAttribute("userName");
		
		return new ModelAndView("user/modifySuccess");
	}

}
