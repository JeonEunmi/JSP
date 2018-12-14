<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
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

		<h1>다양한 전송 방식 GET or POST</h1>

		<div class="panel panel-default">
			<div class="panel-heading">POST 방식 전송</div>
			<div class="panel-body">
			
			<!-- 
				POST 방식 전송
				- 요청 헤더 안쪽 데이터 영역에 저장되어서 전송
				- 주소창의 주소에 노출되지 않는다.
				- 다량의 자료 전송 가능. 바이너리 자료 전송 가능.
 				-->	

				<form action="sample027_receive.jsp" method="post">
					<div class="form-group">
						<label for="name_">Name:</label> <input type="text"
							class="form-control" 
							id="name_" name="name_" placeholder="max 20"
							required>
					</div>
					<div class="form-group">
						<label for="phone">Phone:</label> <input type="text"
							class="form-control" 
							id="phone" name="phone" placeholder="max 20"
							required>
					</div>

					<button type="submit" class="btn btn-default" id="btnAdd">회원정보
						추가</button>

				</form>

			</div>
		</div>


		<div class="panel panel-default">
			<div class="panel-heading">GET 방식 전송</div>
			<div class="panel-body">
				
				<!-- 
				GET 방식 전송
				- 요청 파라미터 끝 부분에 쿼리문자열을 이용해서 전송
				- 예를 들어, "요청주소?키1=값1&키2=값2"
				- 주소창의 주소에 노출된다.
				- 한글, 특수문자, 공백 전송시에는 적합하지 않다
				- 소량의 자료만 전송 가능. 바이너리 자료 전송 불가.
 				-->				
				<!-- method="" 속성 생략시 GET 방식 전송이다. -->
				<form action="sample027_receive.jsp">
					<div class="form-group">
						<label for="name_">Name:</label> <input type="text"
							class="form-control" 
							id="name_" name="name_" placeholder="max 20"
							required>
					</div>
					<div class="form-group">
						<label for="phone">Phone:</label> <input type="text"
							class="form-control" 
							id="phone" name="phone" placeholder="max 20"
							required>
					</div>
					
					<!-- 
					사용자가 입력하지 않은 값 중에 
					프로그램 진행에 필요한 자료는
					hidden 태그를 사용한다.
					-->
					<input type="hidden" name="mode" value="insert">
					
					<button type="submit" class="btn btn-default" id="btnAdd">회원정보
						추가</button>

				</form>

			</div>
		</div>

	</div>

</body>
</html>