<%@ page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import="com.test.*"%>
<%
	String id_ = request.getParameter("id_");
	String age = request.getParameter("age");
	String first_ = request.getParameter("first_");
	String last_ = request.getParameter("last_");
	int result = 0;
	String txt = "";
	if (id_ != null) {
		EmployeeDAO dao = new EmployeeDAO();
		try {
			result = dao.add(new Employee(Integer.parseInt(id_)
					, Integer.parseInt(age), first_, last_));
			if (result == 1) {
				txt = "success";
			} else {
				throw new Exception("데이터베이스 오류 발생!");
			}
		}catch(Exception e) {
			e.printStackTrace();
			txt = "fail";
		}
	}
	response.sendRedirect("sample039.jsp?result="+txt);	
%>