<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//주의) 최초 실행이 아닌 경우만 실행되도록 한다.
	//리다이렉트 액션 진행 후 현재 페이지가 재실행된다.
	//->현재 페이지가 새로고침된다.
	//->입력 폼이 초기화된 상태가 된다.
	//->성공, 실패 메시지 수신 및 결과 출력 필요
	String result = request.getParameter("result");
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

	});
</script>

</head>
<body>

	<div class="container">

		<h1>MySQL 데이터베이스 테스트</h1>

		<div>
			<h2>Employees Table</h2>

			<!-- DML 액션 진행시 폼 페이지, 액션 페이지를 분리해야 한다. -->
			<!-- 
			주의) 액션 페이지 실행 후 폼 페이지로 다시 돌아와야 한다. 
			폼 페이지만 새로고침 문제가 발생하지 않는다 
			-->
			
			<!-- action="" 속성에 액션 페이지 지정 필요 -->
			<form method="post" action="sample038_receive.jsp">
				<div class="form-group">
					<label for="id_">ID:</label>
					<!-- name="" 속성은 JSP 프로그램 연동시 필요 -->
					<input type="text" class="form-control" id="id_" name="id_"
						placeholder="max 20" required>
				</div>
				<div class="form-group">
					<label for="age">AGE:</label> <input type="text"
						class="form-control" id="age" name="age" placeholder="max 20"
						required>
				</div>
				<div class="form-group">
					<label for="first_">FIRST:</label> <input type="text"
						class="form-control" id="first_" name="first_"
						placeholder="max 20" required>
				</div>
				<div class="form-group">
					<label for="last_">LAST:</label> <input type="text"
						class="form-control" id="last_" name="last_" placeholder="max 20"
						required>
				</div>

				<!-- type="submit" 속성은 폼 전송시 필요 -->
				<button type="submit" class="btn btn-default" id="btnAdd">
					Add</button>
				<%-- 성공, 실패 메시지 출력 위치 --%>					
				<%=txt%>

			</form>
		</div>

	</div>

</body>
</html>