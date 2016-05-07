package com.forum.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.forum.email.MyAuthenticator;

public class ForgetPwdController implements Controller{
	
	private static final String MAIL_SERVER_HOST = "smtp.qq.com";
	private static final String USER = "1690314525";
	private static final String PASSWORD = "qzoaopzvjwjjedbj";
	private static final String MAIL_FROM = "1690314525@qq.com";

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession httpSession = request.getSession();
		
		String mailTo = request.getParameter("email");
		System.out.println("收件人："+mailTo);
		
		String info = null;
		
			Properties prop = new Properties();
			prop.setProperty("mail.debug", "true");
			prop.setProperty("mail.transport.protocol", "smtps");
			prop.setProperty("mail.host", MAIL_SERVER_HOST);
			prop.setProperty("mail.port", "465");
			prop.setProperty("mail.smtp.auth", "true");
			
			Authenticator auth = new MyAuthenticator(USER,PASSWORD);
			// 1、创建session
			Session session = Session.getDefaultInstance(prop,auth);
			Transport ts = null;
			
			try {
				// 2、通过session得到transport对象
				ts = session.getTransport();
			} catch (NoSuchProviderException e) {
				e.printStackTrace();
			}
			
			try {
				// 3、连上邮件服务器
				ts.connect(MAIL_SERVER_HOST, USER, PASSWORD);
				// 4、创建邮件
				MimeMessage message = new MimeMessage(session);
				// 邮件消息头
				message.setFrom(new InternetAddress(MAIL_FROM));// 邮件的发件人
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(
						mailTo));// 邮件的收件人
				message.setSubject("测试文本邮件");// 邮件的标题
				// 邮件消息体
				message.setText("测试文本邮件发送！！！郑锋超");
				// 5、发送邮件
				ts.sendMessage(message, message.getAllRecipients());
				ts.close();
				info = "密码重置信息已发送到您的邮箱，请及时查看！！！";
				httpSession.setAttribute("info", info);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			} 
		
		return new ModelAndView("user/success");
	}

}
