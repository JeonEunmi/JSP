<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.test.*"%>
<%@ page import="java.util.*"%>
<%
	//출력 액션 코드 작성
	String key = request.getParameter("key");
	String value = request.getParameter("value");
	if (key == null || key.equals("all")) {
		key = "all";
		value = "";
	}
	StringBuilder sb = new StringBuilder();
	EmployeeDAO dao = new EmployeeDAO();
	int totalcount = dao.totalcount();
	List<Employee> list = dao.list(key, value);
	int count = list.size();
	for (Employee e : list) {
		sb.append("<tr>");
		sb.append(String.format("<td>%s</td>", e.getId_()));
		sb.append(String.format("<td>%s</td>", e.getAge()));
		sb.append(String.format("<td>%s</td>", e.getFirst_()));
		sb.append(String.format("<td>%s</td>", e.getLast_()));
		sb.append("</tr>");
	}

	//리다이렉트 액션 진행 코드 작성
	String result = request.getParameter("result");
	String txt = "";
	if (result != null) {
		if (result.equals("success")) {
			//성공 메시지
			txt = "<div class=\"alert alert-success alert-dismissible fade in\" style=\"display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px;\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a><strong>Success!</strong> 요청한 작업이 처리되었습니다.</div>";
		} else {
			//실패 메시지
			txt = "<div class=\"alert alert-danger alert-dismissible fade in\" style=\"display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px;\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a><strong>Fail!</strong> 요청한 작업이 처리되지 못했습니다.</div>";
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
		$("#key option[value='<%=key%>']").attr("selected", "selected");
		$("#value").val('<%=value%>');
	});
</script>

</head>
<body>

	<div class="container">

		<h1>MySQL 데이터베이스 테스트</h1>
		<h2>Employees Table</h2>
		<div class="panel panel-default" id="input">
			<div class="panel-heading">Add</div>
			<div class="panel-body">
				<!-- 폼 디자인 관련 코드 -->
				<!-- action="sample039_.jsp" -->
				<form method="post" action="sample039_.jsp"
					class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-1" for="id_">ID:</label>
						<div class="col-sm-11">
							<!-- name="" 속성은 JSP 프로그램 연동시 필요 -->
							<input type="text" class="form-control" id="id_" name="id_"
								placeholder="max 20" required>
						</div>
					</div>
					<div class="form-group">
						<label for="age" class="control-label col-sm-1">AGE:</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="age" name="age"
								placeholder="max 20" required>
						</div>
					</div>
					<div class="form-group">
						<label for="first_" class="control-label col-sm-1">FIRST:</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="first_" name="first_"
								placeholder="max 20" required>
						</div>
					</div>
					<div class="form-group">
						<label for="last_" class="control-label col-sm-1">LAST:</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="last_" name="last_"
								placeholder="max 20" required>
						</div>
					</div>

					<!-- type="submit" 속성은 폼 전송시 필요 -->
					<button type="submit" class="btn btn-default" id="btnAdd">
						Add</button>
					<%-- 성공, 실패 메시지 출력 위치 --%>
					<%=txt%>
				</form>
			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<!-- 목록 출력 관련 코드 -->
				<table class="table">
					<tbody>
						<tr>
							<th>ID</th>
							<th>AGE</th>
							<th>FIRST</th>
							<th>LAST</th>
						</tr>
						<%=sb.toString()%>
					</tbody>
				</table>
				<form class="form-inline" method="post">
					<div class="form-group">
						<!-- 전체 자료 갯수 -->
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge" id="totalcount"><%=totalcount%></span>
						</button>
						<!-- 검색 결과 자료 갯수 -->
						<button type="button" class="btn btn-default">
							Count <span class="badge" id="count"><%=count%></span>
						</button>
						<!-- 검색 기준 선택 항목 -->
						<select class="form-control" id="key" name="key">
							<option value="all">ALL</option>
							<option value="id_">ID</option>
							<option value="age">AGE</option>
							<option value="first_">FIRST</option>
							<option value="last_">LAST</option>
						</select>
					</div>
					<div class="input-group">
						<!-- 검색 단어 입력 폼 -->
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search">
						<div class="input-group-btn">
							<!-- 검색 진행 버튼 -->
							<button type="submit" class="btn btn-default" id="btnSearch">
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