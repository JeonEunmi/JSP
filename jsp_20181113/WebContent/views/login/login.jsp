<%@ page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import="com.test.*" %>	
<%
	/* 로그인 액션 처리 페이지 */
	String path = request.getContextPath();
	
	//외부 입력 처리
	String id_ = request.getParameter("id_");
	String pw = request.getParameter("pw");
	
	//데이터베이스 질의 -> login() 메소드
	LoginDAO dao = new LoginDAO();
	Login result = dao.login(id_, pw);
	
	//결과 분석
	//null 반환 -> 로그인 불가 -> 로그인 폼 페이지 이동
	//Login 객체 반환 
	//-> 로그인 가능 
	//-> 세션 저장소에 특정 키를 가진 값(Login 객체) 저장 
	//-> 전용 페이지 이동
	if (id_ == null || result == null) {
		response.sendRedirect(path+"/views/login/loginfailform.jsp");
	} else {
		session.setAttribute("login", result);
		response.sendRedirect(path+"/views/admin/adminbooklist.jsp");
	}
	

%>