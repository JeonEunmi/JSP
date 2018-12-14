<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*"%>
<%@ page import="java.util.*"%>
<%
	// blind = 0 -> 보여 , 1 -> 안보여
	request.setCharacterEncoding("UTF-8");

	/*관리자 전용 페이지*/

	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	GuestbookDAO dao = new GuestbookDAO();

	//출력 및 검색 메소드 호출 -> 컬렉션 반환
	String pageCount = request.getParameter("pageCount");
	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1"; // 페이지 번호 초기값
		pageCount = "10";
	}

	int pageCountTemp = Integer.parseInt(pageCount);
	int pageNumTemp = Integer.parseInt(pageNum);
	int pageStart = pageCountTemp * (pageNumTemp - 1);

	List<Guestbook> list = dao.pageList(pageStart, Integer.parseInt(pageCount));

	int guestbookCount = list.size();
	int c = dao.notBlindCount();

	int startPage = 1;
	int endPage = c / pageCountTemp;


	if (c % pageCountTemp > 0) {
		endPage++;
	}

	//컬렉션 분석
	int count = list.size();
	for (Guestbook g : list) {
		String temp = "";
		if (g.getBlind() == 0) {
			sb.append("<tr>");
			//결과 출력을 위한 동적 테이블 태그 생성
			sb.append(String.format("<td>%s</td>", g.getGid()));
			sb.append(String.format("<td>%s</td>", g.getName_()));
			sb.append(String.format("<td>%s</td>", g.getContent()));
			sb.append(String.format("<td>%s</td>", g.getRegDate()));
			sb.append(String
					.format("<td><button type=\"button\" class=\"btn btn-default btn-xs\">Del</button></td>"));
			sb.append("</tr>");
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
	$(document)
			.ready(
					function() {
						// 페이징 액션 추가
						// 주의) 첫 페이지인 경우 Previous 버튼에 대한 비활성 처리 필요
						// 주의) 마지막 페이지인 경우 Next 버튼에 대한 비활성 처리 필요
						if (
<%=pageNumTemp == startPage%>
	) {
							$("#btnPrevious").attr("disabled", "disabled");
						} else if (
<%=pageNumTemp == endPage%>
	) {
							$("#btnNext").attr("disabled", "disabled");
						}

						// Previous 버튼 액션
						$("#btnPrevious")
								.on(
										"click",
										function() {
											var pageNum = $(this).val();
											window.location
													.assign("sample048.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum="
															+ pageNum);

										});

						// Next 버튼 액션
						$("#btnNext")
								.on(
										"click",
										function() {
											var pageNum = $(this).val();
											window.location
													.assign("sample048.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum="
															+ pageNum);
										});
						
						$("#key option[value='<%=pageCountTemp%>']").attr("selected", "selected");
						

						$("#key")
								.on(
										"change",
										function() {
											var pageCount = $(this).val();
											window.location
													.assign("sample048.jsp?pageNum=1&pageCount="
															+ pageCount);

										});

					});
</script>

</head>
<body>

	<div class="container">

		<h1>블라인드 테스트</h1>

		<div class="panel panel-default panel-warning" id="output">
			<div class="panel-heading">방명록</div>
			<div class="panel-body">

				<table class="table">
					<tbody>
						<tr>
							<th>gid</th>
							<th>name</th>
							<th>contents</th>
							<th>regDate</th>
							<th>delete</th>
						</tr>
						<%=sb.toString()%>
					</tbody>
				</table>

				<!-- action="" 속성 생략시 자기자신에게 폼 전송 -->
				<form class="form-inline" method="POST">
					<div class="form-group">
						<button type="button" class="btn btn-warning">
							Count <span class="badge" id="totalcount"><%=guestbookCount%></span>
						</button>
					</div>

					<button type="button" class="btn btn-warning">
						Page <span class="badge" id="pageNum"><%=pageNum%></span>
					</button>
					<!-- 페이징 버튼 추가 -->
					<button type="button" class="btn btn-warning" id="btnPrevious"
						value="<%=pageNumTemp - 1%>">
						<span class="glyphicon glyphicon-arrow-left"></span> Previous
					</button>
					<button type="button" class="btn btn-warning" id="btnNext"
						value="<%=pageNumTemp + 1%>">
						Next <span class="glyphicon glyphicon-arrow-right"></span>
					</button>
					
					<select class="form-control" id="key" name="key">
						<option value="5">5개씩 보기</option>
						<option value="10" selected>10개씩 보기</option>
						<option value="15">15개씩 보기</option>
						<option value="20">20개씩 보기</option>
					</select>
				</form>
			</div>
		</div>




	</div>

</body>
</html>