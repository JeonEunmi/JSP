<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	/* 
	문제) 
	// 중첩 for문을 이용한 숫자 출력, 테이블 태그를 동적으로 생성하면 모양 유지 가능
	실행 예)
	*/

	StringBuilder sb = new StringBuilder();

	sb.append("<table style=\"text-align:right;\"><tbody>");
	for (int b = 1; b <= 10; ++b) {
		sb.append("<tr>");
		for (int a = 1; a <= 10 - b; ++a) {
			sb.append(String.format("<td></td>"));
		}
		for (int a = 1; a <= b; ++a) {
			sb.append(String.format("<td style=\"width:30px;\">%d</td>",a));
		}
		
		sb.append("</tr>");

	}
	sb.append("</tbody></table>");
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
		<%=sb%>

	</div>

</body>
</html>