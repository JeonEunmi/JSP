<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.guestbook.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	/*일반 사용자용 전용 페이지*/

	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	AdminGuestbookDAO dao = new AdminGuestbookDAO();

	//출력 및 검색 메소드 호출 -> 컬렉션 반환
	String pageCount = request.getParameter("pageCount");
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1"; // 페이지 번호 초기값
		pageCount = "10";
	}
	
	int pageCountTemp = Integer.parseInt(pageCount);
	int pageNumTemp = Integer.parseInt(pageNum);
	int pageStart = pageCountTemp * (pageNumTemp-1);
	
	List<Guestbook> list = dao.pageList(pageStart, Integer.parseInt(pageCount));


	int guestbookCount = 0;
	int c = dao.totalcount();
	
	int startPage = 1;
	int endPage = c / pageCountTemp;


	if (c % pageCountTemp > 0) {
		endPage++;
	}
	
	//컬렉션 분석
	for (Guestbook g : list) {
		String temp = "";
		if (g.getBlind() == 1) {
			temp = "<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-info btn-xs buttonOn active\" value ="
					+ g.getGid() + ">ON</button>"
					+ "<button type=\"button\" class=\"btn btn-info btn-xs buttonOff\" value =" + g.getGid()
					+ ">OFF</button></div>";
			sb.append("<tr style=\"background-color:#F5F5F5;\">");
		} else {
			// 특정 게시물만 active 속성 추가
			// class 식별자 추가 -> jQuery 이벤트 등록 준비
			// value = "" 추가 
			temp = "<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-info btn-xs buttonOn\" value ="
					+ g.getGid() + ">ON</button>"
					+ "<button type=\"button\" class=\"btn btn-info btn-xs buttonOff active\" value ="
					+ g.getGid() + ">OFF</button></div>";

			sb.append("<tr>");
			++guestbookCount;
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
	$(document).ready(
			function() {
				
				$(".buttonOff").on(
						"click",
						function() {
							//$(this).parents("tr").css("background-color", "#F5F5F5");

							//->버튼 클릭시 confirm() 호출
							if (confirm("blind 처리를 해제하시겠습니까?")) {
								// 삭제 액션 페이지 요청 및 번호 전달
								// ->window.location.assign() 메소드
								console.log($(this).val());
								window.location
										.assign("sample048_blind.jsp?gid="
												+ $(this).val() + "&blind=0");
							}

						});

				$(".buttonOn").on(
						"click",
						function() {
							//$(this).parents("tr").css("background-color", "#F5F5F5");

							//->버튼 클릭시 confirm() 호출
							if (confirm("blind 처리하시겠습니까?")) {
								// 삭제 액션 페이지 요청 및 번호 전달
								// ->window.location.assign() 메소드
								console.log($(this).val());
								window.location
										.assign("sample048_blind.jsp?gid="
												+ $(this).val() + "&blind=1");
							}

						});

				// Blind On, Off 버튼에 대한 click 이벤트
				// 블라인드 처리 및 해제 요청
				// -> confirm() 함수
				// 페이징 액션 추가
				// 주의) 첫 페이지인 경우 Previous 버튼에 대한 비활성 처리 필요
				// 주의) 마지막 페이지인 경우 Next 버튼에 대한 비활성 처리 필요
				if(<%=pageNumTemp == startPage%>){
					$("#btnPrevious").attr("disabled","disabled");
				} else if(<%=pageNumTemp == endPage%>){
					$("#btnNext").attr("disabled","disabled");
				}

				// Previous 버튼 액션
		 		$("#btnPrevious").on("click", function(){
					var pageNum = $(this).val();
						window.location.assign("sample048_admin.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum=" + pageNum);				

				});
		 
				// Next 버튼 액션
				$("#btnNext").on("click", function(){
					var pageNum = $(this).val();
					window.location.assign("sample048_admin.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum=" + pageNum);
				});

				
				$("#key option[value='<%=pageCountTemp%>']").attr("selected", "selected");
				

				$("#key")
						.on(
								"change",
								function() {
									var pageCount = $(this).val();
									window.location
											.assign("sample048_admin.jsp?pageNum=1&pageCount="
													+ pageCount);

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
				<!-- action="" 속성 생략시 자기자신에게 폼 전송 -->
				<form class="form-inline" method="POST">
					<div class="form-group">
						<!-- 전체 자료 갯수 -->
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge" id="totalcount"><%=c%></span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge" id="count"><%=guestbookCount%></span>
						</button>
					
					<button type="button" class="btn btn-warning">Page
						<span class="badge" id="pageNum"><%=pageNum%></span>
					</button>
					<!-- 페이징 버튼 추가 -->
					<button type="button" class="btn btn-warning" id = "btnPrevious" value = "<%=pageNumTemp-1%>">
						<span class="glyphicon glyphicon-arrow-left"></span> Previous
					</button>
					<button type="button" class="btn btn-warning" id = "btnNext" value = "<%=pageNumTemp+1%>">
						Next <span class="glyphicon glyphicon-arrow-right"></span>
					</button>
					
					<select class="form-control" id="key" name="key">
						<option value="5">5개씩 보기</option>
						<option value="10" selected>10개씩 보기</option>
						<option value="15">15개씩 보기</option>
						<option value="20">20개씩 보기</option>
					</select>
					</div>

				</form>
			</div>
		</div>





	</div>

</body>
</html>