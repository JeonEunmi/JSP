<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true" %>
<%
/* 
[문제]거스름돈 계산 및 출력
500원, 100원, 50원, 10원짜리 동전을 반환할 수 있는 계산식 작성.
예를 들어, 1500원인 경우 500원 3개, 100원 0개, 50원 0개, 10원 0개
예를 들어, 1400원인 경우 500원 2개, 100원 4개, 50원 0개, 10원 0개
*/

StringBuilder sb = new StringBuilder();
int money = 1400;

int balance1 = money % 500;
int tmp1 = money / 500;

int balance2 = balance1 % 100;
int tmp2 = balance1 / 100;

int balance3 = balance2 % 50;
int tmp3 = balance2 / 50;

int balance4 = balance3 % 10;
int tmp4 = balance3 / 10;

sb.append(String.format("%d원 거스름돈 : 500원 %d개, 100원 %d개, 50원 %d개, 10원 %d개", money, tmp1, tmp2, tmp3, tmp4));
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
	
	<%= sb%>	
	
	</div>

</body>
</html>