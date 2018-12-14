<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
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

		<h1>로그인 테스트 - session Object</h1>

		<h2>로그인 전 화면</h2>
		<%-- 성공, 실패 메시지 출력 위치 --%>
		<%=txt%>



		<div class="panel panel-default" id="input">

			<div class="panel-body">
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">로그인</button>

				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog modal-sm">
						<div class="modal-content text-center">
							<!--Header-->
							<div class="modal-header">

								Login
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>


							<div class="modal-body">
								<form action="sample042_login.jsp" method="post" id="myModal">

									<div class="form-group">
										<input type="text" class="form-control" id="id_" name="id_"
											placeholder="ID(MAX 30)" required value="">
									</div>
									<div class="form-group">
										<input type="password" class="form-control" id="pw" name="pw"
											placeholder="ID(MAX 30)" required value="">
									</div>

									<!-- 폼 전송시 type="submit" 속성 필수 -->
									<button type="submit" class="btn btn-default btn-warning"
										id="btnLogin">로그인</button>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>