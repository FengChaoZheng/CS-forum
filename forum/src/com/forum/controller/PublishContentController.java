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
		content.setSectionName(sectionName);
		
		String title = request.getParameter("title");
		content.setTitle(title);
		String message = request.getParameter("message");
		content.setMessage(message);
		
		cd.create(content);
		return new ModelAndView("redirect:/user/content.jsp");
	}

}
