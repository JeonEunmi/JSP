<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.picture.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pid = request.getParameter("pid");
	
	System.out.println(pid);
	// 데이터 베이스 액션 처리
	int result = 0;
	String txt = "";
	if (pid != null) {
		PictureDAO dao = new PictureDAO();
		try {
			result = dao.pictureRemove(pid);
			if (result == 1) {
				txt = "success";
			} else {
				throw new Exception("데이터베이스 오류 발생!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			txt = "fail";
		}
	}

	// 결과(성공 또는 실패) 메시지 반환
	response.sendRedirect("sample046.jsp?result=" + txt);
%>