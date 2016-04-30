package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ExitController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		System.out.println("退出时会话的内容："+userName);
		
		String strValue = request.getParameter("value");
		int value = Integer.parseInt(strValue);
		
		session.removeAttribute("userName");
		
		ModelAndView mav = new ModelAndView();
		switch(value){
		case 1:
			mav.setViewName("redirect:/user/index.jsp");
			break;
		case 2:
			mav.setViewName("redirect:/admin/adminLogin.jsp");
		}
		return mav;
	}

}
