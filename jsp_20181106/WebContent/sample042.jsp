<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.member.*"%>
<%@ page import="java.util.*"%>
<%
	// 검색 과정
	// key, value 수신

	request.setCharacterEncoding("UTF-8");
	String key = request.getParameter("key");
	String value = request.getParameter("value");
	// 최초 실행시 key = "all", value="" 설정
	if (key == null || key.equals("all")) {
		key = "all";
		value = "";
	}
	// 검색 메소드 호출
	StringBuilder sb = new StringBuilder();
	MemberDAO dao = new MemberDAO();
	int totalcount = dao.totalcount();
	List<Member> list = dao.memberList(key, value);

	// 전체 및 검색 결과 출력 과정
	int count = list.size();
	for (Member m : list) {
		sb.append("<tr>");
		sb.append(String.format("<td>%s</td>", m.getMid_()));
		sb.append(String.format("<td>%s</td>", m.getName_()));
		sb.append(String.format("<td>%s</td>", m.getPhone()));
		// 삭제 진행을 위한 버튼 추가
		sb.append("<td><button type=\"button\" class=\"btn btn-default btn-xs btnDel\" value = " + m.getMid_()
				+ ">Delete</button>");
		sb.append("<button class=\"btn btn-default btn-xs btnUpdate\" value = " + m.getMid_() +">개인정보 수정</button></td>");
		sb.append("</tr>");
	}

	//리다이렉트 액션 진행 코드 작성
	String result = request.getParameter("result");
	//System.out.println(result);
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
		//검색 액션 진행시 상태값 유지를 위해서
		//전송 전 자료(key, value)를 현재 페이지에서 다시 설정 필요
		//->새로고침 현상의 문제점 해결
		$("#key option[value='<%=key%>']").attr("selected", "selected");
		$("#value").val('<%=value%>');

						//삭제 진행을 위한 버튼 click  이벤트 추가
						//->on() 메소드
						$(".btnDel")
								.on(
										"click",
										function() {
											var m = $(this).parents("td").siblings()
													.eq(0).text();
											var n = $(this).parents("td").siblings()
													.eq(1).text();
											var p = $(this).parents("td").siblings()
													.eq(2).text();
											// 번호, 이름, 전화번호 포함 메시지 출력
											var temp = m + "/" + n + "/" + p
													+ "\n\n현재 자료를 삭제하시겠습니까?";
											//->버튼 클릭시 confirm() 호출
											if (confirm(temp)) {
												// 삭제 액션 페이지 요청 및 번호 전달
												window.location
														.assign("sample042_delete.jsp?mid_="
																+ $(this).val());
											}

										});

	//개인정보 수정 버튼에 대한 동적 이벤트 등록
	//->기존 개인정보를 입력폼에 출력
	//->'개인정보 추가' 버튼을 '개인정보 수정' 버튼으로 변경

	// 수정 진행을 위한 버튼 click 이벤트 추가
	// -> on() 메소드
	$(".btnUpdate").on("click", function() {
		//화면에 존재하는 항목의 제목들을 수정
		$("#input .panel-heading").text("회원 수정");
		$("#input button").text("회원정보 수정");

		// hidden 태그에 고유번호 저장
		$("#mid_").val($(this).val());

		var name_ = $(this).parents("td").siblings().eq(1).text();
		var phone = $(this).parents("td").siblings().eq(2).text();
	
		//특정 번째 객체의 정보를 입력폼에 출력
		$("#name_").val(name_);
		$("#phone").val(phone);
		
		// 입력폼을 수정폼으로 변경
		
		// action="" 속성 변경
		$("#mid_").parents("form").attr("action", "sample042_update.jsp");
	
	


	});
	});

</script>

</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="sample042_insert.jsp"> <img
					src="resources/img/sist_logo.png" alt="sist_logo.png"></a> 회원관리 <small>v5.0
					BootStrap+MySQL</small>
			</h1>
		</div>


		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원 추가</div>
			<div class="panel-body">
				<!-- 폼 전송시 action ="", method="" 속성 필수 -->
				<!-- DML액션시 폼페이지, 액션 페이지 분리 필요 -->
				<!-- id는 jQuery, name은 JSP 할 때 사용. -->
				<form action="sample042_insert.jsp" method="post">
				
				<input type="hidden" id="mid_" name="mid_" value="값">
				

					<div class="form-group">
						<!-- 폼 전송시 name ="" 속성 필수. 동일 자료, 동일 식별자. -->
						<!-- required 속성 추가 시 내용을 채워야 submit 가능 -->
						<input type="text" class="form-control" id="name_" name="name_"
							placeholder="Name(max 20)" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="Phone(max 15)" required>
					</div>

					<!-- 폼 전송시 type="submit" 속성 필수 -->
					<button type="submit" class="btn btn-default" id="btnAdd">회원정보
						추가</button>
					<%-- 성공, 실패 메시지 출력 위치 --%>
					<%=txt%>

				</form>

			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">회원 목록</div>
			<div class="panel-body">

				<table id="members" class="table">
					<tr>
						<th>Mid</th>
						<th>Name</th>
						<th>Phone</th>
						<th></th>
					</tr>
					<!-- 
					<tr>
						<td>M01</td>
						<td>Peter</td>
						<td>010-1234-1234</td>
					</tr>
					<tr>
						<td>M02</td>
						<td>Lois</td>
						<td>010-4321-4321</td>
					</tr>
					<tr>
						<td>M03</td>
						<td>Joe</td>
						<td>010-6543-6543</td>
					</tr>
					<tr>
						<td>M04</td>
						<td>Cleveland</td>
						<td>010-0987-0987</td>
					</tr>
					 -->
					<%=sb.toString()%>
				</table>
				<form class="form-inline" method="post">
					<button class="btn btn-default">
						TotalCount <span class="badge" id="totalcount"><%=totalcount%></span>
					</button>
					<!-- 검색 결과 자료 갯수 -->
					<button class="btn btn-default">
						Count <span class="badge" id="count"><%=count%></span>
					</button>

					<!-- 검색 기준 선택 항목 -->
					<select class="form-control" id="key" name="key">
						<option value="all">All</option>
						<option value="name_">Name</option>
						<option value="phone">Phone</option>
					</select>

					<div class="input-group">
						<!-- 검색 단어 입력 폼 -->
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search">
						<div class="input-group-btn">
							<!-- 검색 진행 버튼 -->
							<button type="submit" class="btn btn-default" id="btnSearch">
								<i class="glyphicon glyphicon-search"></i>
							</button>
							<div id="demo"></div>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>

</body>
</html>