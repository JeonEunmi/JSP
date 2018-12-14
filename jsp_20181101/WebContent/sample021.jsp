<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%!
	/* 독립적인 private 메소드 선언 영역 */
	//정수 값 1개 전달시 팩토리얼 연산 및 결과 반환
	private int calc(int a) {
		int result = 1;
		for (int b=1; b<=a; ++b) {
			result *= b;
		}
		return result;
	}
%>	
<%
	//팩토리얼 연산 메소드 호출
	StringBuilder sb = new StringBuilder();
	for (int a = 1; a<=10; ++a) {
		int result = calc(a);
		sb.append(String.format("%s -> %s<br>", a, result));
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
		<h1>팩토리얼 연산</h1>
		<div><%=sb.toString()%></div>
	</div>

</body>
</html>