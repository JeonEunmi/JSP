<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* JSP의 기본 영역(scope) */
	/*
	특정 객체가 활동할 수 있는 범위 
	
	1. PAGE 영역
	- 특정 JSP 페이지에서만 활동하는 영역
	
	2. REQUEST 영역
	- 두 개 이상의 JSP 페이지에서 공유할 수 있는 영역
	- request 객체를 이용해서 확인
	- 두 개 이상의 JSP 페이지가 서로 연결된 상태일 때만 가능
	- 요청 단위로 공유된다. 예를 들어, 요청시작 -> A -> B -> C -> 응답  
	
	3. SESSION 영역
	- 두 개 이상의 JSP 페이지에서 공유할 수 있는 영역
	- session 객체를 이용해서 확인
	- 두 개 이상의 JSP 페이지가 연결되지 않아도 가능
	*/

	// 세선 영역에 공유 정보 저장
	String s = (String) session.getAttribute("test");
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
			세션정보 :
			<%=s%></div>

	</div>

</body>
</html>