<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
   StringBuilder sb = new StringBuilder();

   Connection conn = null;
   PreparedStatement pstmt = null;
   try {
      conn = MySQLConnection80.connect();

      String sql = "SELECT id, age, first_, last_  FROM  employees  ORDER BY id;";
      pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      sb.append("<table class=\"table\"><tbody>\r\n");
      sb.append("<tr><th>ID</th><th>AGE</th><th>FIRST</th><th>LAST</th></tr>");
      while(rs.next()) {
         int id = rs.getInt("id");
         int age = rs.getInt("age");
         String first_ = rs.getString("first_");
         String last_ = rs.getString("last_");
         sb.append("<tr>");
         sb.append(String.format("<td>%s</td>", id));
         sb.append(String.format("<td>%s</td>", age));
         sb.append(String.format("<td>%s</td>", first_));
         sb.append(String.format("<td>%s</td>", last_));
         sb.append("</tr>\r\n");
      }
      sb.append("</tbody></table>\r\n");
      rs.close();
   } catch (Exception e) {
      //서버의 콘솔창에 메시지 출력
      e.printStackTrace();
   } finally {
      try {
         MySQLConnection80.close();
      } catch (Exception e) {
         e.printStackTrace();
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
   <h1>My SQL 데이터 베이스 테스트</h1>
   <div><%= sb.toString() %>
   </div>
   </div>

</body>
</html>