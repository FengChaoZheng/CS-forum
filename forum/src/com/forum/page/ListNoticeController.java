package com.forum.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.NoticeDao;
import com.forum.model.Notice;

public class ListNoticeController implements Controller{
	
	private NoticeDao nd;

	public void setNd(NoticeDao nd) {
		this.nd = nd;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int pageNo = 1;// int pageSize=5;
		String strPageNo = request.getParameter("pageNo");
		if (strPageNo != null) {
			pageNo = Integer.parseInt(strPageNo); // 把字符串转换成数字
		}

		ModelAndView mav = new ModelAndView();

		try {
			List<Notice> noticelist = nd.listNotice(pageNo);
			for (Notice notice : noticelist) {
				System.out.println("notice return :"+notice.getId());
			}
			request.setAttribute("noticelist", noticelist);
			Integer pageCount = new Integer(nd.getPageCount());
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNo", pageNo);
			mav.setViewName("admin/jsp/adminNoticeInfo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}

}
