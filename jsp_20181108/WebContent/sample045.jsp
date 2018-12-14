<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.*, com.picture.*"%>
<%
	/* 사진 리스트 불러오기 및 출력 코드 작성 */
	PictureDAO dao = new PictureDAO();
	List<Picture> pictureList = dao.pictureList();
	int pictureCount = pictureList.size();

	/*
	주의) <li> 태그 생성시 class="active" 속성은 
	첫 번째 <li> 태그만 지정해야 한다. 
	주의) <div> 태그 생성시 class="active" 속성은 
	첫 번째 <div> 태그만 지정해야 한다. 
	*/
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

		<h1>Picture List</h1>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">
				Picture List <a href="sample046.jsp"
					class="btn btn-warning btn-xs btn pull-right" role="button">사진
					추가</a>
			</div>

			<div class="panel-body">



				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<!-- 
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					 	-->
						<%=sb01.toString()%>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<!-- 
						<div class="item active">
							<img src="resources/picture/la.jpg" alt="Los Angeles">
						</div>

						<div class="item">
							<img src="resources/picture/chicago.jpg" alt="Chicago">
						</div>

						<div class="item">
							<img src="resources/picture/ny.jpg" alt="New York">
						</div>
						 -->
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


	</div>

</body>
</html>