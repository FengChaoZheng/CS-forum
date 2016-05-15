package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ToSingleController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

//		HttpSession session = request.getSession();
		/*String userName = (String)session.getAttribute("username");
		String userSex = (String)session.getAttribute("userSex");
		String userEmail = (String)session.getAttribute("useremail");
		String userAuthority = (String)session.getAttribute("userauthority");
		String userLastTime = (String)session.getAttribute("userlastTime");*/
		
		return new ModelAndView("redirect:/user/single.jsp");
	}

}
