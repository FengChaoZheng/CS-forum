package com.forum.checkcode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ChangeCheckcode implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String str = (String) session.getAttribute("checkCode");
		System.out.println("会话持有的验证码："+str);
		
		return new ModelAndView("redirect:/user/register.jsp");
	}

}
