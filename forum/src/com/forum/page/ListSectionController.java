package com.forum.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.SectionDao;
import com.forum.model.Section;

public class ListSectionController implements Controller{
	
	private SectionDao sd;

	public void setSd(SectionDao sd) {
		this.sd = sd;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		int pageNo = 1;// int pageSize=5;
		String strPageNo = request.getParameter("pageNo");
		if (strPageNo != null) {
			pageNo = Integer.parseInt(strPageNo); // 把字符串转换成数字
		}
		
		List<Section> sectionlist = sd.listSection(pageNo);
		for (Section section : sectionlist) {
			System.out.println("section return :"+section.getId());
		}
		session.setAttribute("sectionlist", sectionlist);
		Integer pageCount = new Integer(sd.getPageCount());
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNo", pageNo);

		return new ModelAndView("admin/jsp/adminModuleSelect");
	}

}
