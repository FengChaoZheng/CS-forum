package com.forum.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.DocumentDao;
import com.forum.model.Document;

public class ListDocumentController implements Controller{
	
	private DocumentDao dd;

	public void setDd(DocumentDao dd) {
		this.dd = dd;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int pageNo = 1;// int pageSize=5;
		String strPageNo = request.getParameter("pageNo");
		if (strPageNo != null) {
			pageNo = Integer.parseInt(strPageNo); // 把字符串转换成数字
		}
		
		String strValue = request.getParameter("value");
		int value = Integer.parseInt(strValue);

		ModelAndView mav = new ModelAndView();

		try {
			List<Document> documentlist = dd.listDocument(pageNo);
			for (Document document : documentlist) {
				System.out.println("document return :"+document.getId());
			}
			request.setAttribute("documentlist", documentlist);
			Integer pageCount = new Integer(dd.getPageCount());
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNo", pageNo);
			
			switch(value){
			case 1:
				mav.setViewName("/user/download");
				break;
			case 2:
				mav.setViewName("/admin/jsp/adminDocumentInfo");
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}

}
