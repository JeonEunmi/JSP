<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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

		<h1>폼 전송 테스트</h1>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원 추가</div>
			<div class="panel-body">

				<!-- 폼 전송에 필요한 폼 엘리먼트 구성 -->
				<!-- 예를 들어, 사용자가 웹페이지에 입력한 이름, 전화번호를 서버로 전송 -->
				<!-- 
				form 엘리먼트에서 
				
				action="" 속성은 
				서브밋 액션 진행시 연결될 서버 프로그램 주소 지정
				action="" 속성 생략시 자기 자신에게 전송된다
				
				method="POST" 속성은
				전송 방식을 지정한다. 
				GET 또는 POST 중에 하나를 선택한다.
				일반적으로 폼 전송에는 POST 사용.
				method="" 속성 생략시 GET 방식 지정된다.
				--> 
				<form action="sample025_receive.jsp" method="post">
					<div class="form-group">
						<label for="name_">Name:</label> 
						<!-- 
						input 엘리먼트에서 JSP 페이지와 연결시
						name="식별자" 속성 지정 필수
						동일 자료, 동일 식별자
						
						required 속성은 필수 입력 항목 지정시 사용
						서브밋 액션 진행시 입력되었는지 확인한다.
						
						주의) name_ 식별자 사용시 "name"이 아니라 "name_"로 사용할 것
						-->
						<input type="text"
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
					JSP 페이지와 연결을 위해서
					input, button 엘리먼트에서
					type="submit" 속성 지정 필수
					버튼 클릭시 서브밋 액션이 진행된다.
					-->
					<button type="submit" class="btn btn-default" id="btnAdd">회원정보
						추가</button>

				</form>

			</div>
		</div>



	</div>

</body>
</html>