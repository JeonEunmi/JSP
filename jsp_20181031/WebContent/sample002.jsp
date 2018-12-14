<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* JSP 코드 영역*/

	String s = "Hello, world!";
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
		<%-- JSP 실행 결과를 동적 HTML 구문으로 작성--%>
		<%--
		기존 HTML 구문과 같이 결합되어서 출력된다.
		클라이언트에게 전달되는 HTML 구문은 
		<h1>Hello, world!</h1>가 될 예정이다. 
		--%>
		<h1><%=s%></h1>


	</div>

</body>
</html>