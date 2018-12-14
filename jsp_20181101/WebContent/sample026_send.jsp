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

		<h1>다양한 폼 형식 전송</h1>

		<div class="panel panel-default">
			<div class="panel-heading">회원 정보 입력</div>
			<div class="panel-body">

				<form action="sample026_receive.jsp" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name_" name="name_"
							placeholder="Name(max 20)" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="Phone(max 20)" required>
					</div>

					<div class="checkbox">
						<!-- 
						checkbox(radio)는 
						
						value="" 속성의 값이 서버로 전송된다. 
						예를 들어, 강사의 강의가능과목 처리시
						value="" 속성에는 과목코드를 지정해 놓는다.
						
						name="식별자" 속성을 동일하게 지정한다.
						서버 전송시 선택된 항목의 value 값이
						배열 자료형으로 전송된다.
						단, 선택된 항목이 없으면 전송되지 않는다.
						-->
						<label><input type="checkbox" value="Checkbox 1"
							name="opt01">Checkbox 1</label>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" value="Checkbox 2"
							name="opt01">Checkbox 2</label>
					</div>
					<div class="checkbox disabled">
						<!-- 
						 disabled 속성 지정시 비활성 상태가 된다.
						 서브밋 액션 진행시 참여하지 않는다. 
						 -->
						<label><input type="checkbox" value="Checkbox 3"
							name="opt01" disabled>Checkbox 3</label>
					</div>

					<div class="radio">
						<label><input type="radio" name="opt02" value="Radio 1"
							checked>Radio 1</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="opt02" value="Radio 2">Radio
							2</label>
					</div>
					<div class="radio disabled">
						<label><input type="radio" name="opt02" value="Radio 3"
							disabled>Radio 3</label>
					</div>

					<div class="form-group">
						<label for="sel1">Select list:</label>

						<!-- select 엘리먼트는 radio와 동작하는 방법이 같다 -->
						<select class="form-control" id="opt02" name="opt02">
							<option value="Select 1" selected="selected">Select 1</option>
							<option value="Select 2">Select 2</option>
							<option value="Select 3">Select 3</option>
							<option value="Select 4">Select 4</option>
						</select>
					</div>

					<button type="submit" class="btn btn-default" id="btnAdd">회원정보
						추가</button>

				</form>

			</div>
		</div>


	</div>

</body>
</html>