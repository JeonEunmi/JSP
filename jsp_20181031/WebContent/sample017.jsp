<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	/*
	[문제]로또 번호(1~45) 추출 및 출력. 
	중복 제외.
	1~45 범위의 숫자를 중복되지 않게 6개 추출
	출력시 정렬된 상태로 출력
	
	출력예)
	1회 : 5, 6, 16, 18, 37, 38
	2회 : 4, 5, 31, 35, 43, 45
	...
	*/

	int[] result = new int[6];
	StringBuilder sb = new StringBuilder();
	int tmp = 0;

	for (int i = 0; i < result.length;) {
		tmp = (int) (Math.random() * 45) + 1;
		boolean flag = true;

		for (int j = 0; j < result.length; ++j) {
			if (tmp == result[j]) {
				flag = false;
			}
		}
		if (flag) {
			result[i] = tmp;
			++i;
		}
	}

	int temp = 0;

	for (int i = 0; i < result.length; i++) {
		for (int j = i; j < result.length; j++) {
			if (result[i] > result[j]) {
				temp = result[i];
				result[i] = result[j];
				result[j] = temp;
			}
		}
	}

	for (int i = 0; i < result.length; i++) {
		if (i < result.length - 1) {
			sb.append(String.format("%d, ", result[i]));
		} else{
			sb.append(String.format("%d", result[i]));
		}
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
	<%=sb %>
	</div>

</body>
</html>