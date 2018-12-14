<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	// 1부터 10까지의 합 연산 및 출력

	/*
	출력예)
	1 + 2 + 3 + 4 + 5 + 6 + 7 + ... = 55
	*/
	int sum = 0;
	StringBuilder sb = new StringBuilder();
	for (int i = 1; i < 11; i++) {
		sum += i;
		if(i < 10){
		sb.append(String.format("%d + ", i));
		} else{
		sb.append(String.format("%d", i));			
		}
		
	}
	sb.append(String.format(" = %d", sum));
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
		<h1>1부터 10까지의 합 연산 및 출력</h1>	
		<%=sb%>

	</div>

</body>
</html>