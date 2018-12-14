<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.picture.*"%>
<%
	String path = request.getContextPath();
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
	
	//주의) 서버에 등록된 물리적 사진 삭제 필요
	//----------------------------------------
	

	response.sendRedirect(path + "/views/admin/adminpicturelist.jsp?result=" + txt);
%>