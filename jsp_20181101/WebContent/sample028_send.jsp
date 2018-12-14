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


		<div class="panel panel-default">
			<div class="panel-heading">구구단 출력</div>
			<div class="panel-body">
				<form action="sample028_receive.jsp">

					<div class="form-group">
						<label for="sel1">몇단을 출력하시겠습니까?:</label>

						<!-- 구구단 요청을 위해 요청주소의 끝부분에 쿼리문자열 작성 -->
						<!-- select 엘리먼트는 radio와 동작하는 방법이 같다 -->
						<select class="form-control" id="num" name="num">
							<option value="2" selected="selected">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
						</select>
					</div>

					<button type="submit" class="btn btn-default" id="btnAdd">구구단
						결과!</button>

				</form>

			</div>
		</div>

	</div>

</body>
</html>