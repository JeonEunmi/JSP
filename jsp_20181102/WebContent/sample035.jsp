<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.*"%>
<%


	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	ScoreDAO dao = new ScoreDAO();

	//출력 및 검색 메소드 호출 -> 컬렉션 반환
	List<Score> list = dao.list();
	
	int c = dao.totalcount();

	//컬렉션 분석
	int count = list.size();
	for (Score s : list) {
		//결과 출력을 위한 동적 테이블 태그 생성
		sb.append("<tr>");
		sb.append(String.format("<td>%s</td>", s.getAid()));
		sb.append(String.format("<td>%s</td>", s.getName()));
		sb.append(String.format("<td>%s</td>", s.getSub1()));
		sb.append(String.format("<td>%s</td>", s.getSub2()));
		sb.append(String.format("<td>%s</td>", s.getSub3()));
		sb.append(String.format("<td>%s</td>", s.getTotal()));
		sb.append(String.format("<td>%s</td>", s.getAvg()));
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

	});
</script>

</head>
<body>

	<div class="container">
		<h1>성적 관리</h1>
		<div>
			<table class="table">
				<tbody>
					<tr>
						<th>학번</th>
						<th>이름</th>
						<th>과목1</th>
						<th>과목2</th>
						<th>과목3</th>
						<th>총점</th>
						<th>평균</th>
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
			</div>
			

		</form>



	</div>

</body>
</html>