<%@ page language="java" contentType="text/html; charset=UTF-8"  
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	/* 로그인 여부 검사 과정 추가 */
	
	/* 세션 저장소에서 특정 키를 가진 값 확인 */
	Object login = session.getAttribute("login");
	/* 세션 저장소에 값이 없는 경우 null이 반환된다 */
	if (login == null) {
		//로그인하지 않은 사용자 접근 차단
		//->로그인 폼 페이지로 강제 이동
		response.sendRedirect("sample042.jsp");
	}
	
	/* 
	주의) 현재 페이지에서 더 이상의 페이지 이동 또는 재요청이 없는 경우 
	일정 시간(기본값 20분) 경과시 세션 소멸될 수 있다. 
	*/

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
		
		<h1>로그인 테스트 - session Object</h1>
		
		<h2>로그인 후 화면 - 로그인한 사용자 전용 페이지</h2>
	
	 	<a href ="sample042_logout.jsp" class="btn btn-warning btn-md" role="button">로그아웃</a>
	</div>

</body>
</html>