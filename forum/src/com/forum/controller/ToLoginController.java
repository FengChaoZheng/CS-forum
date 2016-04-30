package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ToLoginController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String strValue = request.getParameter("value");
		int value = Integer.parseInt(strValue);
		
		ModelAndView mav = new ModelAndView();
		
		switch(value){
		case 1:
			mav.setViewName("redirect:/user/login.jsp");
			break;
		case 2:
			mav.setViewName("redirect:/admin/adminLogin.jsp");
			break;
		}
		
		return mav;
	}

}
