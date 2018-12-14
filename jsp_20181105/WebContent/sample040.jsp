<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.member.*"%>
<%@ page import="java.util.*"%>
<%
	StringBuilder sb = new StringBuilder();
	MemberDAO dao = new MemberDAO();
	int totalcount = dao.totalcount();
	List<Member> list = dao.memberList();
	int count = list.size();
	for (Member m : list) {
		sb.append("<tr>");
		sb.append(String.format("<td>%s</td>", m.getMid_()));
		sb.append(String.format("<td>%s</td>", m.getName_()));
		sb.append(String.format("<td>%s</td>", m.getPhone()));
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

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="sample040.jsp"> <img src="resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 회원관리 <small>v5.0 BootStrap+MySQL</small>
			</h1>
		</div>


		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원 추가</div>
			<div class="panel-body">

				<form action="sample040_.jsp" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="Name(max 20)" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="phone" name="phone"
							placeholder="Phone(max 20)" required>
					</div>

					<button type="submit" class="btn btn-default" id="btnAdd">회원정보
						추가</button>

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

				<button class="btn btn-default">
					TotalCount <span class="badge" id="totalcount"><%=totalcount%></span>
				</button>

			</div>
		</div>

	</div>

</body>
</html>