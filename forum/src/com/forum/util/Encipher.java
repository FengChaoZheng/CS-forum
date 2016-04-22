package com.forum.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class Encipher {
	
	public static String MD5(String oldStr) {
		byte[] oldBytes = oldStr.getBytes();
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] newBytes = md.digest(oldBytes);
			BASE64Encoder encoder = new BASE64Encoder();
			//为什么用md5算法加密后又要利用base64算法进行编码：
			//因为md5加密后得到的数据是字节数组，将字节数组用base64算法加密后得到的是字符串，
			//这样有利于在其在数据库中的存储。
			String newStr = encoder.encode(newBytes);
			return newStr;
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
	}

}
