<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");

	StringBuilder sb = new StringBuilder();
	sb.append(String.format("<h3>%s단</h3>", num));
	sb.append("<div>");

	for (int i = 1; i < 10; i++) {
		sb.append(String.format("%s * %s = %s <br>", num, i, (Integer.parseInt(num)) * i));
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
	<h1>구구단 결과</h1>
	<%= sb.toString() %></div>

</body>
</html>