package com.lovo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LoginController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//得到页面的值
		String userName = request.getParameter("username");
		//选择下一个页面
		ModelAndView mav = new ModelAndView();
		//添加模型数据  可以是任意的POJO对象
		mav.addObject("username",userName);
		//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
		mav.setViewName("index");
		
		return mav;
	}

}
