<%@ page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import="com.test.*" %>	
<%
	/* 로그아웃 액션 처리 페이지 */
	
	/* 세션 객체 강제 소멸 및 페이지 이동 */
	session.invalidate();
	response.sendRedirect("sample042.jsp?result=success");

%>