<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	/* 
	구구단 요청 및 결과 출력
	사용자가 원하는 수(1 ~ 9)를 가지고 구구단 연산 결과 출력.
	
	출력예)
	1단 2단 3단 ...
	-------------------
	5단 
	5 * 1 = 5
	...
	
	5 * 9 = 45
	*/

	//자료 수신이 안되는 경우 null 반환
	String num = request.getParameter("num");
	if (num == null) {
		num = "1";
	}

	StringBuilder sb = new StringBuilder();
	int n = Integer.parseInt(num);
	sb.append(String.format("<h3>%s단</h3>", num));
	sb.append("<div>");
	for (int a = 1; a <= 9; ++a) {
		sb.append(String.format("%s * %s = %s <br>", num, a, (n * a)));
	}
	sb.append("</div>");

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
			//특정 번째 <li> 태그에
			//class="active" 속성 동적 추가
			$("#parent li:eq(<%=n-1%>)").addClass("active");
	}); 
</script>

</head>
<body>

	<div class="container">
		<h1>구구단 요청 및 결과 출력</h1>
		
		<div class="panel panel-default">
			<div class="panel-heading">GET 방식 전송</div>
			<div class="panel-body">

				<ul class="pagination" id="parent">
					<li><a href="sample029.jsp?num=1">1단</a></li>
					<li><a href="sample029.jsp?num=2">2단</a></li>
					<li><a href="sample029.jsp?num=3">3단</a></li>
					<li><a href="sample029.jsp?num=4">4단</a></li>
					<li><a href="sample029.jsp?num=5">5단</a></li>
					<li><a href="sample029.jsp?num=6">6단</a></li>
					<li><a href="sample029.jsp?num=7">7단</a></li>
					<li><a href="sample029.jsp?num=8">8단</a></li>
					<li><a href="sample029.jsp?num=9">9단</a></li>
				</ul>

			</div>
		</div>		
		
		
		<div class="panel panel-default">
			<div class="panel-heading">GET 방식 전송</div>
			<div class="panel-body">
				<%=sb.toString()%>
			</div>
		</div>
		
		
	</div>

</body>
</html>