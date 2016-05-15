package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.ContentDao;
import com.forum.model.Content;

public class PublishContentController implements Controller{
	
	private Content content;
	private ContentDao cd;

	public void setContent(Content content) {
		this.content = content;
	}

	public void setCd(ContentDao cd) {
		this.cd = cd;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String userName = (String) session.getAttribute("userName");
		content.setUserName(userName);
		String sectionName = (String) session.getAttribute("sectionName");
		System.out.println("会话中保存的模块名："+sectionName);
		content.setSectionName(sectionName);
		
		String title = request.getParameter("title");
		content.setTitle(title);
		String message = request.getParameter("message");
		content.setMessage(message);
		
		cd.create(content);
//		String url = "redirect:/listContent.do?sectionName="+sectionName+"&value=1";
//		System.out.println("发布之后重定向的路径："+url);
		return new ModelAndView("redirect:/user/index.jsp");
	}

}
