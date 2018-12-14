package com.test;

import java.util.*;

import com.connection.MySQLConnection80;

import java.sql.*;

//(데이터베이스)저장소 운영 클래스
public class ScoreDAO {

   //출력 및 검색 메소드
   public List<Score> list() {
      List<Score> result = new ArrayList<Score>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         //데이터베이스 연결 설정
         conn = MySQLConnection80.connect();

         //쿼리 문자열
         //주의) 쿼리문 끝에 ; 없어야 한다.
         String sql = "SELECT aid, name_, sub1, sub2, sub3\r\n" + 
         		"	,(SELECT sub1+sub2+sub3 FROM Score WHERE aid = sc.aid) total\r\n" + 
         		"    , ((sub1+sub2+sub3) / 3) AS avg\r\n" + 
         		"    FROM Score sc";
         
         //쿼리 실행
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         
         //쿼리 결과 분석
         while(rs.next()) {
        	String aid = rs.getString("aid");
            String name = rs.getString("name_");
            int sub1 = rs.getInt("sub1");
            int sub2 = rs.getInt("sub2");
            int sub3 = rs.getInt("sub3");
            int total = rs.getInt("total");
            Double avg = rs.getDouble("avg");
            
            //주의) ResultSet 객체는 현재 메소드 범위를 벗어날 수 없다
            //ResultSet 객체 -> 컬렉션 객체로 복사가 필요하다
            //컬렉션 저장소에 Employee 객체를 저장하는 액션 추가            
            result.add(new Score(aid, name, sub1, sub2, sub3, total, avg));
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
         String sql = "SELECT COUNT(*) totalcount FROM score";
   
      
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