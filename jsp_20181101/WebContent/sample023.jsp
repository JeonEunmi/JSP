<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.*" %>	
<%!
	/* 독립적인 private 메소드 선언 영역 */
	private String lotto() {
		int[] a = new int[6];
		for (int b = 0; b < a.length;) {
			int temp = (int) (Math.random() * 45) + 1;
			//특정 숫자가 이미 존재하는 숫자인지 검사
			boolean check = true;
			for (int g = 0; g < b; ++g) {
				if (temp == a[g]) {
					check = false;
				}
			}
			if (check) {
				a[b] = temp;
				++b;
			}
		}
		Arrays.sort(a);
		return Arrays.toString(a);
	}
%>
<%
	/*
	[문제]로또 번호(1~45) 추출 및 출력. 
	중복 제외.
	1~45 범위의 숫자를 중복되지 않게 6개 추출
	출력시 정렬된 상태로 출력
	JSP 선언부(Declaration)를 이용한 메소드 구현
	
	출력예)
	1회 : 5, 6, 16, 18, 37, 38
	2회 : 4, 5, 31, 35, 43, 45
	...
	*/
	StringBuilder sb = new StringBuilder();
	for (int a = 1; a<=10; ++a) {
		sb.append(String.format("%s회 : %s<br>", a, lotto()));
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
		<h1>로또 번호</h1>
		<div><%=sb.toString()%></div>
	</div>

</body>
</html>