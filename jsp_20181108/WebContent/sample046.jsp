<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.*, com.picture.*"%>
<%
	//파일업로드 과정 마무리
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

	for (int a = 0; a < pictureCount; ++a) {
		Picture p = pictureList.get(a);
		sb01.append(String.format("<div class=\"col-md-3\">"));
		sb01.append(String.format("<div class=\"thumbnail\">"));
		sb01.append(String.format("<a href=\"resources/picture/%s\">", p.getFilename()));
		sb01.append(String.format("<img src=\"resources/picture/%s\" alt=\"%s\"  width=\"300\" height=\"200\">",
				p.getFilename(), p.getContent()));
		sb01.append(String.format(" </a>"));

		/* 이미지 파일 및 정보 삭제를 위한 삭제버튼 추가 */
		sb01.append(String.format(
				"<p>%s<button type=\"button\" class=\"close\" value=" + p.getPid() + ">&times;</button></p>",
				p.getContent()));

		System.out.println(p.getPid());
		sb01.append(String.format(" </div></div>"));

		if ((a+1) % 4 == 0) {
			sb01.append("</div><div class=\"row\">");
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
	$(document).ready(
			function() {

				//이미지 삭제 버튼 클릭시 confirm() 호출
				//window.location.assign() 메소드

				$(".close").on(
						"click",
						function() {

							//->버튼 클릭시 confirm() 호출
							if (confirm("현재 사진을 삭제하시겠습니까?")) {
								// 삭제 액션 페이지 요청 및 번호 전달
								window.location
										.assign("sample046_delete.jsp?pid="
												+ $(this).val());
							}

						});
			});
</script>

</head>
<body>

	<div class="container">

		<h1>파일 업로드 테스트</h1>
		<%-- 성공, 실패 메시지 출력 위치 --%>
		<%=txt%>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">Picture Upload</div>
			<div class="panel-body">
				<!-- 
					주의) 파일 업로드를 위해서 <form> 엘리먼트에
					enctype="multipart/form-data" 속성 필수
					-->
				<form action="sample046_insert.jsp" method="post"
					enctype="multipart/form-data">

					<div class="form-group">
						<!-- 
							주의) 파일 업로드를 위해서 파일선택폼 필요
							type="file" 속성은 파일선택시 사용 
							주의) 입력폼에 선택버튼이 기본 제공된다.
							-->
						<input type="file" class="form-control" id="filename"
							name="filename" placeholder="파일선택" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="content"
							name="content" placeholder="사진설명(max 100)" required value="">
					</div>

					<!-- 폼 전송시 type="submit" 속성 필수 -->
					<button type="submit" class="btn btn-info">업로드</button>


				</form>
			</div>
		</div>

		<div class="panel panel-default" id="list">
			<div class="panel-heading">Picture List</div>

			<div class="panel-body">
				<div class="row">
					<%=sb01.toString()%>
				</div>

			</div>
		</div>

	</div>
</body>
</html>