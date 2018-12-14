package com.util;

public class Util {

	/* 공유 가능한 public 메소드 선언 */
	public static String toBin(int a) {
		String result = "";
		while (a != 0) {
			int b = a % 2;
			a = a / 2;
			result = b + result;
		}
		return result;
	}
	
}
