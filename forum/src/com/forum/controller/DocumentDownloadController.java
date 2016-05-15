package com.forum.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class DocumentDownloadController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		//ModelAndView mav = new ModelAndView();

		//得到要下载的文件名
		String fileName = request.getParameter("filename");
		fileName = new String(fileName.getBytes("iso8859-1"),"utf-8");
		//上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
		String fileSaveRootPath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		//通过文件名找出文件的所在目录
		String path = findFileSavePathByFileName(fileName,fileSaveRootPath);
		//得到要下载的文件
		File file = new File(path+"\\"+fileName);
		//如果文件不存在
		if(!file.exists()){
			session.setAttribute("downloadMessage", "您要下载的资源已被删除！！");
			return new ModelAndView("redirect:/user/false.jsp");
		}
		//处理文件名
		String realname = fileName.substring(fileName.indexOf("_")+1);
		//设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(realname, "utf-8"));
		//读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(path+"\\"+fileName);
		//创建输出流
		OutputStream out = response.getOutputStream();
		//创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		//循环将输入流中的内容读取到缓冲区当中
		while((len = in.read(buffer))>0){
			//输出缓冲区的内容到浏览器，实现文件下载
			out.write(buffer, 0, len);
		}
		//关闭文件输入流
		in.close();
		//关闭输出流
		out.close();
		//mav.setViewName("user/download");
		return null;
	}
	
	public String findFileSavePathByFileName(String filename,String saveRootPath){
		
		int hashcode = filename.hashCode();
		int dir1 = hashcode&0xf;//0--15
		int dir2 = (hashcode&0xf0)>>4;//0--15
		String dir = saveRootPath+"\\"+dir1+"\\"+dir2;
		File file = new File(dir);
		if(!file.exists()){
			//创建目录
			file.mkdirs();
		}
		return dir;
	}

}
