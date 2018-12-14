<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.guestbook.*, com.test.*"%>
<%@ page import="java.util.*"%>
<%
	//로그인 과정 마무리

	//절대경로 확인
	String path = request.getContextPath();
	/*로그인 여부 검사 과정 추가*/

	/*세션 저장소에서 특정 키를 가진 값 확인*/
	Object login = session.getAttribute("login");
	String info = "";
	/*세션 저장소에 값이 없는 경우 null이 반환된다.*/
	if (login == null) {
		//로그인하지 않은 사용자 접근 차단
		response.sendRedirect(path + "/views/login/loginfailform.jsp");
	} else{
		info = ((Login)login).getId_();
	}

	/*일반 사용자용 전용 페이지*/

	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	AdminGuestbookDAO dao = new AdminGuestbookDAO();

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

	int guestbookCount = 0;
	int c = dao.totalcount();
	int listcount = 0;

	int startPage = 1;
	int endPage = c / pageCountTemp;

	if (c % pageCountTemp > 0) {
		endPage++;
	}

	//컬렉션 분석
	for (Guestbook g : list) {
		String temp = "";
		if (g.getBlind() == 0) {
			temp = String.format(
					"<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-info btn-xs buttonOn\" value =\"%s\">ON</button>"
							+ "<button type=\"button\" class=\"btn btn-info btn-xs buttonOff\" value =\"%s\" %s>OFF</button></div>",
					g.getGid(), g.getGid(), "disabled=\"disabled\"");
			sb.append("<tr>");
			++listcount;
		} else {
			// 특정 게시물만 active 속성 추가
			// class 식별자 추가 -> jQuery 이벤트 등록 준비
			// value = "" 추가 
			temp = String.format(
					"<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-info btn-xs buttonOn\" value =\"%s\" %s>ON</button>"
							+ "<button type=\"button\" class=\"btn btn-info btn-xs buttonOff\" value =\"%s\">OFF</button></div>",
					g.getGid(), "disabled=\"disabled\"", g.getGid());
			sb.append("<tr style=\"background-color:#F5F5F5;\">");
			++guestbookCount;
			++listcount;
		}

		//결과 출력을 위한 동적 테이블 태그 생성
		sb.append(String.format("<td>%s</td>", g.getGid()));
		sb.append(String.format("<td>%s</td>", g.getName_()));
		sb.append(String.format("<td>%s</td>", g.getContent()));
		sb.append(String.format("<td>%s</td>", g.getRegDate()));
		sb.append(String.format("<td>%s</td>", g.getClientIP()));
		sb.append(String.format("<td>%s</td>", temp));
		sb.append("</tr>");
	}
	
	//성공 또는 실패 메시지 수신 및 출력 코드 필요
	String result = request.getParameter("result");
	String txt = "";
	if (result != null) {
		if (result.equals("success")) {
			//성공 메시지
			txt = "<div class=\"alert alert-success alert-dismissible fade in\" style=\"padding-top: 5px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a><strong>Success!</strong> 요청한 작업이 처리되었습니다.</div>";
		} else {
			//실패 메시지
			txt = "<div class=\"alert alert-danger alert-dismissible fade in\" style=\"padding-top: 5px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a><strong>Fail!</strong> 요청한 작업이 처리되지 못했습니다.</div>";
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {
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
								.assign("<%=path%>/views/admin/blind.jsp?gid="
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
								.assign("<%=path%>/views/admin/blind.jsp?gid="
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
				window.location.assign("<%=path%>/views/admin/adminbooklist.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum=" + pageNum);				

		});
 
		// Next 버튼 액션
		$("#btnNext").on("click", function(){
			var pageNum = $(this).val();
			window.location.assign("<%=path%>/views/admin/adminbooklist.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum=" + pageNum);
		});

		
		$("#key option[value='<%=pageCountTemp%>']").attr(
								"selected", "selected");

						$("#key")
								.on(
										"change",
										function() {
											var pageCount = $(this).val();
											window.location
													.assign("<%=path%>/views/admin/adminbooklist.jsp?pageNum=1&pageCount="
															+ pageCount);

										});
					});
</script>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="adminbooklist.jsp"><img
					src="<%=path%>/resources/img/sist_logo.png" alt="sist_logo.png"></a>
				방명록 <small>v1.0</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="adminbooklist.jsp">방명록 관리</a></li>
					<li><a href="<%=path%>/views//admin/adminpicturelist.jsp">사진
							관리</a></li>
					<li><a href="<%=path%>/views/login/logout.jsp">[관리자/<%=info%>]로그
							아웃
					</a></li>
				</ul>
			</div>
		</nav>

		<!-- 성공, 실패 메시지 출력 위치 -->
		<%=txt%>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">방명록 글목록</div>
			<div class="panel-body">

				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>글쓴이</th>
							<th>글내용</th>
							<th>작성일</th>
							<th>Client IP</th>
							<th>Blind</th>
						</tr>
					</thead>
					<tbody>
						<%=sb.toString()%>
					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge" id="totalcount"><%=c%></span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge" id="count"><%=listcount%></span>
						</button>
						<button type="button" class="btn btn-default">
							BlindCount <span class="badge" id="blindCount"><%=guestbookCount%></span>
						</button>

						<button type="button" class="btn btn-default">
							Page <span class="badge" id="pageNum"><%=pageNum%></span>
						</button>
						<!-- 페이징 버튼 추가 -->
						<button type="button" class="btn btn-default" id="btnPrevious"
							value="<%=pageNumTemp - 1%>">
							<span class="glyphicon glyphicon-arrow-left"></span> Previous
						</button>
						<button type="button" class="btn btn-default" id="btnNext"
							value="<%=pageNumTemp + 1%>">
							Next <span class="glyphicon glyphicon-arrow-right"></span>
						</button>

						<select class="form-control" id="key" name="key">
							<option value="5">5개씩 보기</option>
							<option value="10" selected>10개씩 보기</option>
							<option value="15">15개씩 보기</option>
							<option value="20">20개씩 보기</option>
						</select>

						<!-- 검색 기준 선택 항목 추가 -->
						<select class="form-control" id="key" name="key">
							<option value="name_">Name</option>
							<option value="content">Content</option>
							<option value="regDate">RegDate</option>
						</select>

					</div>
					<div class="input-group">
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search">

						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
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
