<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*"%>
<%
	// 액션 전용 페이지는 HTML 코드가 없는 것이 특징이다.
	String path = request.getContextPath();

	// 클라이언트가 보내는 자료 수신
	request.setCharacterEncoding("UTF-8");
	String gid = request.getParameter("gid");
	String pw = request.getParameter("pw");

	// 데이터 베이스 액션 처리
	int result = 0;
	String txt = "";
	if (gid != null) {
		GuestbookDAO dao = new GuestbookDAO();
		try {
			result = dao.guestbookDel(gid, pw);
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

	//결과(성공 또는 실패) 메시지 반환 -> 쿼리 문자열 사용
	//주의)상대경로 대신 절대경로 표기를 권장한다.
	response.sendRedirect(path + "/index.jsp?result=" + txt);
%>