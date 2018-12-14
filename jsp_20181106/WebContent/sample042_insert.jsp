<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.member.*"%>
<%
	// 액션 전용 페이지는 HTML 코드가 없는 것이 특징이다.

	// 클라이언트가 보내는 자료 수신
	request.setCharacterEncoding("UTF-8");
	String name_ = request.getParameter("name_");
	String phone = request.getParameter("phone");
	// 데이터 베이스 액션 처리
	int result = 0;
	String txt = "";
	if (name_ != null) {
		MemberDAO dao = new MemberDAO();
		try {
			result = dao.memberAdd(new Member(null, name_, phone));
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
	response.sendRedirect("sample042.jsp?result="+txt);
%>