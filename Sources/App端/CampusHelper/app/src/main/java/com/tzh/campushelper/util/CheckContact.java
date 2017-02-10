package com.tzh.campushelper.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckContact {
	/**
	 * 联系方式验证
	 */
	public static boolean isContact(String s) {
		if (isMobile(s) || isPhone(s) || checkEmail(s))
			return true;
		return false;
	}

	/**
	 * 手机号验证
	 */
	public static boolean isMobile(String str) {
		Pattern p = null;
		Matcher m = null;
		boolean flag = false;
		p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号
		m = p.matcher(str);
		flag = m.matches();
		return flag;
	}

	/**
	 * 电话号码验证
	 */
	public static boolean isPhone(String str) {
		Pattern p;
		Matcher m = null;
		boolean flag = false;
		p = Pattern.compile("^[0,8][0-9]{2,3}-[0-9]{5,10}$"); // 验证带区号的
		m = p.matcher(str);
		flag = m.matches();
		return flag;
	}

	/**
	 * 验证输入的邮箱格式是否符合
	 */
	public static boolean checkEmail(String email) {
		boolean flag;
		try {
			String check = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
}
