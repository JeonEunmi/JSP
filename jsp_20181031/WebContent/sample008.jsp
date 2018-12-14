<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	/* 시스템(서버)의 날짜/시간 출력 */
	Calendar cal = Calendar.getInstance();
	int y = cal.get(Calendar.YEAR);
	int m = cal.get(Calendar.MONTH) + 1;
	int d = cal.get(Calendar.DATE);
	String s = String.format("%s-%s-%s", y, m, d);
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
시스템의 날짜/시간 :<%=s%></div>

	</div>

</body>
</html>