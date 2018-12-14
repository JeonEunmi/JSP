<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.*"%>
<%
	// 사용자가 검색 요청한 key, value 수신
	// 수신 자료 없는 null 반환 -> key = "all" 지정 -> 전체출력
	// -> key = "all" 지정
	// -> 전체 출력

	String key = request.getParameter("key");
	String value = request.getParameter("value");

	if (key == null || key.equals("all")) {
		key = "all";
	}

	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	EmployeeDAO dao = new EmployeeDAO();

	//출력 및 검색 메소드 호출 -> 컬렉션 반환
	List<Employee> list = dao.list(key, value);

	int c = dao.totalcount();

	//컬렉션 분석
	int count = list.size();
	for (Employee e : list) {
		//결과 출력을 위한 동적 테이블 태그 생성
		sb.append("<tr>");
		sb.append(String.format("<td>%s</td>", e.getId_()));
		sb.append(String.format("<td>%s</td>", e.getAge()));
		sb.append(String.format("<td>%s</td>", e.getFirst()));
		sb.append(String.format("<td>%s</td>", e.getLast()));
		sb.append("</tr>");
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
	 	//검색 액션 진행시 상태값 유지를 위해서
		//전송 전 자료를 현재 페이지에서 다시 설정 필요
		// -> 새로고침 현상의 문제점 해결
		$("#key option[value ='<%=key%>
	']").attr("selected", "selected");
		$("#value").val(
<%=value%>
	);
	});
</script>

</head>
<body>

	<div class="container">
		<h1>MySQL 데이터베이스 테스트</h1>
		<div>
			<h2>Employees Table</h2>
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
		</div>


		<!-- action="" 속성 생략시 자기자신에게 폼 전송 -->
		<form class="form-inline" method="POST">
			<div class="form-group">
				<!-- 전체 자료 갯수 -->
				<button type="button" class="btn btn-default">
					TotalCount <span class="badge" id="totalcount"><%=c%></span>
				</button>
				<!-- 검색 결과 자료 갯수 -->
				<button type="button" class="btn btn-default">
					Count <span class="badge" id="count"><%=count%></span>
				</button>
				<!-- 검색 기준 선택 항목 -->
				<select class="form-control" id="key" name="key">
					<option value="all">All</option>
					<option value="id_">Id</option>
					<option value="age">Age</option>
					<option value="first_">First</option>
					<option value="last_">Last</option>
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

</body>
</html>