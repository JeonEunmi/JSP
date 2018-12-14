package com.test;

import java.util.*;

import com.connection.MySQLConnection80;

import java.sql.*;

//(데이터베이스)저장소 운영 클래스
public class EmployeeDAO {

   //출력 및 검색 메소드
   public List<Employee> list(String key, String value) {
      List<Employee> result = new ArrayList<Employee>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         //데이터베이스 연결 설정
         conn = MySQLConnection80.connect();

         //쿼리 문자열
         //주의) 쿼리문 끝에 ; 없어야 한다.
         String sql = "SELECT id_, age, first_, last_  FROM  employees\r\n";
         if (key.equals("all")) {
            sql += "";
         } else if (key.equals("id_")){
            sql += "WHERE id_=?\r\n";
         } else if (key.equals("age")){
            sql += "WHERE age=?\r\n";
         } else if (key.equals("first_")){
            //MySQL에서는 대소문자 구분없이 검색 가능
            sql += "WHERE first_=?\r\n";
         } else if (key.equals("last_")){
            //MySQL에서는 대소문자 구분없이 검색 가능
            sql += "WHERE last_=?\r\n";
         }
         sql += "ORDER BY id_";
         
         //쿼리 실행
         pstmt = conn.prepareStatement(sql);
         if (key.equals("all")) {
         } else if (key.equals("id_") || key.equals("age")){
            //JDBC에서 데이터바인딩 인덱스는 1부터 시작됨
            pstmt.setInt(1, Integer.parseInt(value));
         } else if (key.equals("first_") || key.equals("last_")){
            pstmt.setString(1, value);
         }
         ResultSet rs = pstmt.executeQuery();
         
         //쿼리 결과 분석
         while(rs.next()) {
            int id_ = rs.getInt("id_");
            int age = rs.getInt("age");
            String first_ = rs.getString("first_");
            String last_ = rs.getString("last_");
            
            //주의) ResultSet 객체는 현재 메소드 범위를 벗어날 수 없다
            //ResultSet 객체 -> 컬렉션 객체로 복사가 필요하다
            //컬렉션 저장소에 Employee 객체를 저장하는 액션 추가            
            result.add(new Employee(id_, age, first_, last_));
         }
         
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
      
      return result;
   }
   
   //전체 카운트 메소드
   public int totalcount() {
      int result = 0;
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         //데이터베이스 연결 설정
         conn = MySQLConnection80.connect();

         //쿼리 문자열
         //주의) 쿼리문 끝에 ; 없어야 한다.
         String sql = "SELECT COUNT(*) totalcount FROM employees";
   
      
         pstmt = conn.prepareStatement(sql);
   
         ResultSet rs = pstmt.executeQuery();
         
         //쿼리 결과 분석
         while(rs.next()) {
            result = rs.getInt("totalcount");
         }
         
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
      
      return result;
   }
}