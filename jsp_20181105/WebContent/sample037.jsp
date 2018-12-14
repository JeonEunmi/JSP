<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.test.*"%>
<%
	//클라이언트가 보내는 자료 수신
	//->request 객체
	//->request.getParameter("name식별자")
	//->동일 자료, 동일 식별자
	String id_ = request.getParameter("id_");
	String age = request.getParameter("age");
	String first_ = request.getParameter("first_");
	String last_ = request.getParameter("last_");

	//주의) 최초 실행이 아닌 경우만 실행되도록 한다.
	//주의) 현재 페이지에서 벗어나지 않고 새로고침 실행시 재실행되는 단점이 있다.
	//데이터베이스에 자료 저장
	//->INSERT 쿼리 액션
	//결과 메시지 출력
	int result = 0;
	String txt = "";
	if (id_ != null) {
		//DAO 객체의 add() 메소드 호출
		//->Employee 객체를 이용해서 자료 전달
		EmployeeDAO dao = new EmployeeDAO();
		try {
			result = dao.add(new Employee(Integer.parseInt(id_)
					, Integer.parseInt(age), first_, last_));
			if (result == 1) {
				//성공 메시지
				txt = "<div class=\"alert alert-success alert-dismissible fade in\" style=\"display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px;\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a><strong>Success!</strong> 요청한 작업이 처리되었습니다.</div>";
			} else {
				//실패 메시지 호출
				//->예외 발생
				throw new Exception("데이터베이스 오류 발생!");
			}
		}catch(Exception e) {
			//서버의 콘솔창에 메시지 출력
			e.printStackTrace();
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

			<!-- action="" 속성 생략시 자기자신에게 전송된다. -->
			<form method="post">
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