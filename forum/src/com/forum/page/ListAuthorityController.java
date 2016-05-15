package com.forum.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.AuthorityDao;
import com.forum.model.Authority;

public class ListAuthorityController implements Controller{
	
	private AuthorityDao ad;

	public void setAd(AuthorityDao ad) {
		this.ad = ad;
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
		
		List<Authority> authoritylist = ad.listAuthority(pageNo);
		for (Authority authority : authoritylist) {
			System.out.println("authority return :"+authority.getId());
		}
		session.setAttribute("authoritylist", authoritylist);
		Integer pageCount = new Integer(ad.getPageCount());
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNo", pageNo);

		return new ModelAndView("admin/jsp/adminAuthorityInfo");
	}

}
