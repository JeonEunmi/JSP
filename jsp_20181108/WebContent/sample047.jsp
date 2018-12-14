<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	/*관리자 전용 페이지*/

	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	AdminGuestbookDAO dao = new AdminGuestbookDAO();

	//출력 및 검색 메소드 호출 -> 컬렉션 반환
	List<Guestbook> list = dao.list();

	int guestbookCount = list.size();
	int c = dao.totalcount();

	//컬렉션 분석
	int count = list.size();
	for (Guestbook g : list) {
		String temp = "";
		if (g.getBlind() == 0) {
	temp = "<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-info btn-xs active\" id =\"buttonOn\">ON</button>"
			+ "<button type=\"button\" class=\"btn btn-info btn-xs id =\"buttonOff\">OFF</button></div>";
	sb.append("<tr style=\"background-color:#F5F5F5;\">");
		} else {
	temp = "<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-info btn-xs\" id =\"buttonOn\">ON</button>"
			+ "<button type=\"button\" class=\"btn btn-info btn-xs active id =\"buttonOff\">OFF</button></diszv>";
	sb.append("<tr>");
		}

		
		//결과 출력을 위한 동적 테이블 태그 생성
		sb.append(String.format("<td>%s</td>", g.getGid()));
		sb.append(String.format("<td>%s</td>", g.getName_()));
		sb.append(String.format("<td>%s</td>", g.getPw()));
		sb.append(String.format("<td>%s</td>", g.getContent()));
		sb.append(String.format("<td>%s</td>", g.getRegDate()));
		sb.append(String.format("<td>%s</td>", g.getClientIP()));
		sb.append(String.format("<td>%s</td>", temp));
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

		$("#buttonOn").on("click", function() {
			$(this).parents("tr").css("background-color", "#F5F5F5");
		});
	});
</script>

</head>
<body>

	<div class="container">

		<h1>블라인드 테스트</h1>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">방명록</div>
			<div class="panel-body">

				<table class="table">
					<tbody>
						<tr>
							<th>gid</th>
							<th>name</th>
							<th>password</th>
							<th>contents</th>
							<th>regDate</th>
							<th>clientIP</th>
							<th>blind</th>
						</tr>
						<%=sb.toString()%>
					</tbody>
				</table>
			</div>
		</div>



		<!-- action="" 속성 생략시 자기자신에게 폼 전송 -->
		<form class="form-inline" method="POST">
			<div class="form-group">
				<!-- 전체 자료 갯수 -->
				<button type="button" class="btn btn-default">
					TotalCount <span class="badge" id="totalcount"><%=c%></span>
				</button>
				<button type="button" class="btn btn-default">
					Count <span class="badge" id="totalcount"><%=guestbookCount%></span>
				</button>
			</div>


		</form>


	</div>

</body>
</html>