<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* JSP가 제공하는 기본(내장) 객체 */
	/* 
	기본(내장) 객체는 직접적인 객체 생성 과정없이 바로 사용할 수 있는 객체이다.
	
	1. request
	- javax.servlet.http.HttpServletRequest
	- 사용자 요청 처리 객체
	- 예를 들어, 사용자 요청 주소 분석 등의 일을 한다.
	
	2. reponse
	- javax.servlet.http.HttpServletResponse
	- 서버 응답 처리 객체
	- 예를 들어, 응답 페이지의 인코딩 설정 지정 등의 일을 한다.
	- 리다이렉트 액션 처리시 필요
	
	3. session
	- javax.servlet.http.HttpSession
	- HTTP 세션 관리 객체
	- 예를 들어, 로그인 정보 등을 메모리에 저장할 때 사용한다.
	- JSP 페이지들 간에 정보 공유시 사용한다.
	
	4. out
	- javax.servlet.jsp.JspWriter
	- 출력 스트림 객체
	- JSP 페이지의 최종 결과는 out 객체를 통해서 클라이언트에게 전달된다.
	
	*/
	//클라이언트의 IP 주소 확인
	String result = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html>
<head>
<title>쌍용교육센터</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>

</head>
<body>

	<div class="container">

		<div id="demo">
			IP주소 :
			<%=result%></div>

	</div>

</body>
</html>