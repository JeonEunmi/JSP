<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import = "com.guestbook.*" %>
<%
	/*관리자 전용 페이지*/

	// 글번호(gid), 블라인드값(blind)을 수신 처리
	request.setCharacterEncoding("UTF-8");
	String gid = request.getParameter("gid");
	String blind = request.getParameter("blind");
	
	// 데이터 베이스 액션 처리	
	if (gid != null) {
		AdminGuestbookDAO dao = new AdminGuestbookDAO();
		try {
	dao.blind(gid, Integer.parseInt(blind));
		} catch (Exception e) {
	e.printStackTrace();
		}
	}

	// 결과메시지 반환 및 페이지 이동
	response.sendRedirect("sample048_admin.jsp?result=success");
%>

