<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	/* 독립적인 private 메소드 선언 영역 */
	
%>	
<%
	/* JSP 페이지 구성 요소 */
	/* 
	1. 선언문 
	- 현재 페이지의 JSP 구성 정보를 제공
	- Directive
	- JSP 페이지 상단부에 위치시킨다
	- page(필수), taglib, include 
	- 속성명="값" 형태의 구성 정보 지정
	
	2. JSP 코드 영역
	- Scriptlet
	- JSP 페이지 상단부에 위치시킨다
	- 액션 관련 코드 작성
	- Java 문법의 코드 + JSP 코드
	- 출력문은 사용하지 않는다.
	
	3. 출력문
	- Expression
	- 출력을 실제로 하게될 위치에 작성한다.
	- 출력 결과가 HTML, jQuery 문법에 맞도록 작성한다.
	
	4. 선언부
	- Declaration
	- JSP 페이지 내부에서 독립적인 메소드 선언시 사용
	- JSP 페이지 상단부에 위치시킨다
	- 실제로는 .java 파일을 연결해서 사용한다.
	
	*/
	
	String result = "Hello, World!";

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
		var a = "<%=result%>";
		console.log(a);
	});
</script>

</head>
<body>

	<div class="container">
	
		<div id="demo">결과 : <%=result%></div>
	
	</div>

</body>
</html>