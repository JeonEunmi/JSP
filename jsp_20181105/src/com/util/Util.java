package com.util;

public class Util {

	/* ���� ������ public �޼ҵ� ���� */
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
