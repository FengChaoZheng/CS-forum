package com.forum.util;

import java.io.UnsupportedEncodingException;

public class ConvertEncoding {
	
	// 编码转换，防止乱码
	public static String changeToUtf(String str) {
		String result = "";
		try {
			result = new String(str.getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
		return result;
	}

}
