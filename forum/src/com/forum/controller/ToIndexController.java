package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ToIndexController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String userName = (String) session.getAttribute("userName");
		
		String strValue = request.getParameter("value");
		int value = Integer.parseInt(strValue);
		
		ModelAndView mav = new ModelAndView();
		
		switch(value){
		case 1:
			mav.setViewName("redirect:/user/index.jsp");
			break;
		case 2:
			if(userName != null)
			    mav.setViewName("redirect:/admin/jsp/adminIndex.jsp");
			else
				mav.setViewName("redirect:/admin/adminLogin.jsp");
			break;
		}
		return mav;
	}

}
