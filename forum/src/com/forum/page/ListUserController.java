package com.forum.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.dao.UserDao;
import com.forum.model.User;

public class ListUserController implements Controller {
	
	private UserDao ud;

	public void setUd(UserDao ud) {
		this.ud = ud;
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
			List<User> userlist = ud.listUser(pageNo);
			for (User user : userlist) {
				System.out.println("user return :"+user.getId());
			}
			request.setAttribute("userlist", userlist);
			Integer pageCount = new Integer(ud.getPageCount());
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNo", pageNo);
			mav.setViewName("admin/jsp/adminUserInfo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}
