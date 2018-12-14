<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.picture.*, com.guestbook.*"%>
<%
	//절대경로 확인
	String path = request.getContextPath();

	//로그인 과정 마무리
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

	/* 사진 리스트 불러오기 및 출력 코드 작성 */
	PictureDAO dao = new PictureDAO();
	List<Picture> pictureList = dao.pictureList();
	int pictureCount = pictureList.size();

	StringBuilder sb01 = new StringBuilder();
	StringBuilder sb02 = new StringBuilder();
	if (pictureCount == 0) {
		//데이터베이스에 그림파일 정보가 없는 경우 기본값 설정
		sb01.append(
				String.format("<li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>"));
		sb02.append(String.format("<div class=\"item active\">"));
		sb02.append(String.format("<img src=\"resources/picture/chicago.jpg\" alt=\"chicago\">"));
		sb02.append(String.format("<div class=\"carousel-caption\">"));
		sb02.append(String.format("<h3>시카고 공연</h3>"));
		sb02.append(String.format("</div>"));
		sb02.append(String.format("</div>"));
	} else {
		/* 
		주의) <li> 태그 생성시 class="active" 속성은 
		첫 번째 <li> 태그만 지정해야 한다. 
		주의) <div> 태그 생성시 class="active" 속성은 
		첫 번째 <div> 태그만 지정해야 한다. 
		*/
		for (int a = 0; a < pictureCount; ++a) {
			Picture p = pictureList.get(a);
			sb01.append(String.format("<li data-target=\"#myCarousel\" data-slide-to=\"%d\" %s></li>", a,
					(a == 0) ? "class=\"active\"" : ""));
			sb02.append(String.format("<div class=\"item %s\">", (a == 0) ? "active" : ""));
			sb02.append(String.format("<img src=\"resources/picture/%s\" alt=\"%s\">", p.getFilename(),
					p.getContent()));
			sb02.append(String.format("<div class=\"carousel-caption\">"));
			sb02.append(String.format("<h3>%s</h3>", p.getContent()));
			sb02.append(String.format("</div>"));
			sb02.append(String.format("</div>"));

		}
	}

	//---------------------------------------------------------------------------------------

	/*일반 사용자용 전용 페이지*/

	// blind = 0 -> 보여 , 1 -> 안보여
	request.setCharacterEncoding("UTF-8");

	/*관리자 전용 페이지*/

	//쿼리 결과 출력을 위한 문자열 준비
	StringBuilder sb = new StringBuilder();

	//DAO 클래스에 대한 객체 생성
	GuestbookDAO guest = new GuestbookDAO();

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

	List<Guestbook> list = guest.pageList(pageStart, Integer.parseInt(pageCount));

	int guestbookCount = list.size();
	int c = guest.notBlindCount();

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
			sb.append(String.format(
					"<td><button type=\"button\" class=\"btn btn-default btn-xs\" data-toggle=\"modal\" data-target=\"#deleteFormModal\" id =\"btnDel\" value ="
							+ g.getGid() + ">Del</button></td>"));
			sb.append("</tr>");
		}
	}

	//---------------------------------------------------------------------------------------
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

<style>
div#carousel:hover, div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

/* 사진 너비가 일정하게 보이도록 설정 추가 */
#myCarousel img {
	width: 100%;
}
</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Util.js 라이브러리 연결 -->
<script src="resources/script/util.js"></script>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	function myMap() {

		//위도, 경도 
		var handok = new google.maps.LatLng(37.499285, 127.033271);
		var center = new google.maps.LatLng(37.500544, 127.033215);

		//맵 정보
		var mapProp = {
			center : center,
			zoom : 17,
		};
		//맵 요청
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		//마커 표시
		var marker = new google.maps.Marker({
			position : handok
		});
		marker.setMap(map);

		//InfoWindow
		var infowindow = new google.maps.InfoWindow(
				{
					content : "<div style=\"text-align:center;\"><strong>한독약품빌딩</strong><br>서울특별시 강남구 역삼1동 735<br><img src=\"resources/img/handok_small.png\"></div>"
				});
		infowindow.open(map, marker);

	}
</script>



<script>
	$(document).ready(function() {

		// 남은 날짜 출력
		// ->Util.js 라이브러리 필요 
		$("#date").text("(" + dDay("2019-01-17") + ")");

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
									.assign("<%=path%>/index.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum="
											+ pageNum);

						});

		// Next 버튼 액션
		$("#btnNext")
				.on(
						"click",
						function() {
							var pageNum = $(this).val();
							window.location
									.assign("<%=path%>/index.jsp?pageCount="+<%=pageCountTemp%>+"&pageNum="
											+ pageNum);
						});
		
		$("#key option[value='<%=pageCountTemp%>']").attr("selected", "selected");

						$("#key")
								.on(
										"change",
										function() {
											var pageCount = $(this).val();
											window.location
													.assign("<%=path%>/index.jsp?pageNum=1&pageCount="
															+ pageCount);

										});

						$("#btnDel").on("click", function() {

							// hidden 태그에 고유번호 저장
							$("#gid").val($(this).val());

							console.log($("#gid").val($(this).val()));
						});

						//------------------------------------------------------------------------------
						//맵 버튼 클릭시 (구글맵)모달창 오픈하는 과정
						$("button.map").on("click", function() {
							$("div#googleMapModal").modal();
						});
						//모달창 이벤트 등록 -> myMap() 함수 호출, 동적 생성된 엘리먼트 삭제 연계
						$("div#googleMapModal").on("shown.bs.modal",
								function() {
									myMap();
								});
						$("div#googleMapModal").on("hidden.bs.modal",
								function() {
									$("div#googleMap").empty();
								});
						//------------------------------------------------------------------------------

					});
</script>


</head>
<body>

	<div class="container" id="top">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<!-- 주의) 상대경로 대신 절대경로 표기를 권장한다. -->
				<a href="<%=path%>/index.jsp"><img
					src="resources/img/sist_logo.png" alt="sist_logo.png"></a> 방명록 <small>v1.0</small>
				<span style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<div class="nanel panel-default" id="title"
			style="padding-bottom: 10px;">
			<div class="panel-heading">
				서울특별시 강남구 역삼 1동 735 한독약품빌딩 8층 쌍용교육센터 / 지하철 2호선 역삼역 3번출구<br>
				Java&amp;Python 기반 응용SW 개발자 양성과정 2018.06.25 ~ 2019.01.17 <span
					style="color: red;" id="date">(D-50)</span>
				<button class="btn btn-default btn-xs map">Map</button>
				<button class="btn btn-default btn-xs admin" data-toggle="modal"
					data-target="#adminFormModal">Admin</button>
			</div>
		</div>

		<div class="panel panel-default" id="carousel">
			<div class="panel-heading">Picture List</div>
			<div class="panel-body">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<%=sb01.toString()%>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<%=sb02.toString()%>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">방명록 글쓰기</div>
			<div class="panel-body">
				<!-- 주의) 상대 경로 대신 절대 경로 표기를 권장한다. -->
				<form action="<%=path%>/views/guestbook/guestbook_insert.jsp"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name_" name="name_"
							placeholder="Name(max:50)" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control pw" name="pw"
							placeholder="PASSWORD(max:50)" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="content"
							name="content" placeholder="CONTENT(max:500)">
					</div>


					<button type="submit" class="btn btn-default">Submit</button>

				</form>


			</div>
		</div>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">방명록 글목록</div>
			<%=txt%>
			<div class="panel-body">

				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>글쓴이</th>
							<th>글내용</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<%=sb.toString()%>
					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge"><%=c%></span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge"><%=guestbookCount%></span>
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
							<option value="all">All</option>
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


	<!-- Modal -->
	<div id="deleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Delete</h4>
				</div>
				<div class="modal-body">

					<p>본인이 작성한 글인지 확인하는 절차입니다.</p>

					<form action="<%=path%>/views/guestbook/guestbook_delete.jsp"
						method="post">

						<!-- 주의) 삭제 진행을 위해서 글번호 정보가 필요합니다. -->
						<input type="hidden" id="gid" name="gid" value="G001">

						<div class="form-group">
							<input type="password" class="form-control pw" name="pw"
								placeholder="PASSWORD(max:20)" required>
						</div>

						<button type="submit" class="btn btn-default">Submit</button>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- Modal -->
	<div id="adminFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Admin Login</h4>
				</div>
				<div class="modal-body">

					<p>관리자인지 확인하는 절차입니다.</p>

					<form action="<%=path%>/views/login/login.jsp" method="post">

						<div class="form-group">
							<input type="text" class="form-control" id="id_" name="id_"
								placeholder="ID(max:20)" required>
						</div>

						<div class="form-group">
							<input type="password" class="form-control pw" name="pw"
								placeholder="PASSWORD(max:20)" required>
						</div>

						<button type="submit" class="btn btn-default">Submit</button>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- Modal -->
	<div id="googleMapModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Google Map</h4>
				</div>
				<div class="modal-body">

					<!-- 맵 출력 -->
					<div id="googleMap" style="width: 100%; height: 500px;"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>