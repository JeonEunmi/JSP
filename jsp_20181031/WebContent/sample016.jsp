<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	/* 
	문제) 테이블 태그 출력시 동적 배경색 지정 및 모양 유지 
	모양은 삼각형 형태 유지
	10줄, 10칸 유지
	각 셀의 크기는 동일하게 유지
	각 셀별로 다른 배경색 지정
	*/

	StringBuilder sb = new StringBuilder();
	String[] color = {"#7FFFD4", "#DEB887", "#FF7F50", "#6495ED", "#DC143C", "#00008B", "#006400", "#556B2F",
			"#FF8C00", "#E9967A", "#8FBC8F", "#FF1493", "#00BFFF", "#1E90FF", "#ADFF2F", "#F0E68C", "#E6E6FA"
			,"#FFF0F5","#ADD8E6", "#F08080","#E0FFFF", "#90EE90", "#FFA07A", "#778899", "#FFE4E1", "#FFE4B5"};
	sb.append("<table style=\"text-align:right;\"><tbody>");
	int num = 0;
	for (int b = 1; b <= 10; ++b) {
		sb.append("<tr>");
		for (int a = 1; a <= 10 - b; ++a) {
			sb.append(String.format("<td></td>"));
		}
		for (int a = 1; a <= b; ++a) {
		num = (int) (Math.random() * 24) + 1;
			sb.append(String.format("<td style=\"height: 50px; width:50px; background-color : %s;\"></td>",
					color[num]));
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