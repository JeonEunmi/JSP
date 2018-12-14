<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%!
	/* 독립적인 private 메소드 선언 영역 */
	private String toBin(int a) {
		String result = "";
		while (a != 0) {
			int b = a % 2;
			a = a / 2;
			result = b + result;
		}
		return result;
	}
%>
<%
	/* 
	[문제]10진수 -> 2진수 변환 메소드 구현
	JSP 선언부(Declaration)를 이용한 메소드 구현
	1부터 10까지의 수를 2진수로 표현한다.
	*/
	StringBuilder sb = new StringBuilder();
	for (int a = 1; a<=10; ++a) {
		sb.append(String.format("%s -> %s<br>", a, toBin(a)));
	}
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
		<h1>10진수->2진수</h1>
		<div><%=sb.toString()%></div>
	</div>

</body>
</html>