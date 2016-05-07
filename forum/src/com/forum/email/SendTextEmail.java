package com.forum.email;

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

public class SendTextEmail {

	private static final String MAIL_SERVER_HOST = "smtp.qq.com";
	private static final String USER = "1690314525";
	private static final String PASSWORD = "qzoaopzvjwjjedbj";
	private static final String MAIL_FROM = "1690314525@qq.com";
	private static final String MAIL_TO = "1494716041@qq.com";

	public static void main(String args[]) {
		
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
		// 2、通过session得到transport对象
		try {
			ts = session.getTransport();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		}
		// 3、连上邮件服务器
		try {
			ts.connect(MAIL_SERVER_HOST, USER, PASSWORD);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 4、创建邮件
		MimeMessage message = new MimeMessage(session);
		// 邮件消息头
		try {
			message.setFrom(new InternetAddress(MAIL_FROM));
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} // 邮件的发件人
		try {
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(
					MAIL_TO));
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} // 邮件的收件人
		try {
			message.setSubject("测试文本邮件");
		} catch (MessagingException e) {
			e.printStackTrace();
		} // 邮件的标题
		// 邮件消息体
		try {
			message.setText("天下无双。");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 5、发送邮件
		try {
			ts.sendMessage(message, message.getAllRecipients());
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		try {
			ts.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

}
