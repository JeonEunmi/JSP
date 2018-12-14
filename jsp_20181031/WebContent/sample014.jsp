<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	/* 
	[문제]구구단 출력
	임의의 수 (1~9)를 가지고 구구단 연산 결과 출력.
	난수 발생 필요.
	
	출력예)
	5 * 1 = 5
	...
	
	5 * 9 = 45
	*/

	StringBuilder sb = new StringBuilder();

	int number = (int)(Math.random() * 9) + 1;
	int multiply = 0;
	
	for(int i = 1; i < 10; i++){
		multiply = number * i;
		sb.append(String.format("%d * %d = %d <br>", number, i, multiply));
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
	<h1><%=number%>단</h1> 
		<%=sb%>

	</div>

</body>
</html>