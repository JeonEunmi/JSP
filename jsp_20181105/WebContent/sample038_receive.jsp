<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.test.*"%>
<%
	//액션 전용 페이지는 HTML 코드가 없는 것이 특징이다.

	//클라이언트가 보내는 자료 수신
	//->request 객체
	//->request.getParameter("name식별자")
	//->동일 자료, 동일 식별자
	String id_ = request.getParameter("id_");
	String age = request.getParameter("age");
	String first_ = request.getParameter("first_");
	String last_ = request.getParameter("last_");

	//주의) 최초 실행이 아닌 경우만 실행되도록 한다.
	//주의) 현재 페이지에서 벗어나지 않고 새로고침 실행시 재실행되는 단점이 있다.
	//데이터베이스에 자료 저장
	//->INSERT 쿼리 액션
	//결과 메시지 출력
	int result = 0;
	String txt = "";
	if (id_ != null) {
		//DAO 객체의 add() 메소드 호출
		//->Employee 객체를 이용해서 자료 전달
		EmployeeDAO dao = new EmployeeDAO();
		try {
			result = dao.add(new Employee(Integer.parseInt(id_)
					, Integer.parseInt(age), first_, last_));
			if (result == 1) {
				//성공 메시지
				txt = "success";
			} else {
				//실패 메시지 호출
				//->예외 발생
				throw new Exception("데이터베이스 오류 발생!");
			}
		}catch(Exception e) {
			//서버의 콘솔창에 메시지 출력
			e.printStackTrace();
			//실패 메시지
			txt = "fail";
		}
	}
	
	
	//액션 진행 후 현재 페이지를 벗어나야 한다.
	//->새로고침 문제점 발생
	//->리다이렉트를 이용한 페이지 이동
	//->response 객체
	//->sendRedirect() 메소드
	//->성공, 실패 메시지 전달을 위해서 쿼리문자열 사용
	response.sendRedirect("sample038_send.jsp?result="+txt);	
	
	//주의) 리다이렉트 액션 진행시 현재 라인 이후 문장은 실행 불가

%>