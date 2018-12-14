<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name_ = request.getParameter("name_");
	String phone = request.getParameter("phone");
	String mode = request.getParameter("mode");
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
		<div class="panel panel-default" id="output">
			<div class="panel-heading">회원 목록</div>
			<div class="panel-body">

				<table id="members" class="table">
					<tr>
						<th>Mid</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Mode</th>
					</tr>
					<tr>
						<td>M01</td>
						<td><%=name_%></td>
						<td><%=phone%></td>
						<td><%=mode%></td>
					</tr>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<!-- 전체 자료 갯수 -->
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge" id="totalcount">4</span>
						</button>
						<!-- 검색 결과 자료 갯수 -->
						<button type="button" class="btn btn-default">
							Count <span class="badge" id="count">0</span>
						</button>
						<!-- 검색 기준 선택 항목 -->
						<select class="form-control" id="key" name="key">
							<option value="mid">Mid</option>
							<option value="name">Name</option>
							<option value="phone">Phone</option>
							<option value="regDate">RegDate</option>
							<option value="dept">Dept</option>
						</select>
					</div>
					<div class="input-group">
						<!-- 검색 단어 입력 폼 -->
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search">
						<div class="input-group-btn">
							<!-- 검색 진행 버튼 -->
							<button type="button" class="btn btn-default" id="btnSearch">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>

</body>
</html>