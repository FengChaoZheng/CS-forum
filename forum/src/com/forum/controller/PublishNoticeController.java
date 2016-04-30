package com.forum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.NoticeDao;
import com.forum.model.Notice;

public class PublishNoticeController implements Controller{
	
	private Notice notice;
	private NoticeDao nd;

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public void setNd(NoticeDao nd) {
		this.nd = nd;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		Integer userId = (Integer) session.getAttribute("userId");
		String content = request.getParameter("content");
		
		notice.setUserId(userId);
		notice.setContent(content);
		
		nd.create(notice);
		
		return new ModelAndView("redirect:/admin/jsp/adminNoticePublish.jsp");
	}

}
