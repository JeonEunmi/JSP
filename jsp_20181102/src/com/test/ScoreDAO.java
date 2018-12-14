package com.test;

import java.util.*;

import com.connection.MySQLConnection80;

import java.sql.*;

//(�����ͺ��̽�)����� � Ŭ����
public class ScoreDAO {

   //��� �� �˻� �޼ҵ�
   public List<Score> list() {
      List<Score> result = new ArrayList<Score>();
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         //�����ͺ��̽� ���� ����
         conn = MySQLConnection80.connect();

         //���� ���ڿ�
         //����) ������ ���� ; ����� �Ѵ�.
         String sql = "SELECT aid, name_, sub1, sub2, sub3\r\n" + 
         		"	,(SELECT sub1+sub2+sub3 FROM Score WHERE aid = sc.aid) total\r\n" + 
         		"    , ((sub1+sub2+sub3) / 3) AS avg\r\n" + 
         		"    FROM Score sc";
         
         //���� ����
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         
         //���� ��� �м�
         while(rs.next()) {
        	String aid = rs.getString("aid");
            String name = rs.getString("name_");
            int sub1 = rs.getInt("sub1");
            int sub2 = rs.getInt("sub2");
            int sub3 = rs.getInt("sub3");
            int total = rs.getInt("total");
            Double avg = rs.getDouble("avg");
            
            //����) ResultSet ��ü�� ���� �޼ҵ� ������ ��� �� ����
            //ResultSet ��ü -> �÷��� ��ü�� ���簡 �ʿ��ϴ�
            //�÷��� ����ҿ� Employee ��ü�� �����ϴ� �׼� �߰�            
            result.add(new Score(aid, name, sub1, sub2, sub3, total, avg));
         }
         
         rs.close();
      } catch (Exception e) {
         //������ �ܼ�â�� �޽��� ���
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
   
   //��ü ī��Ʈ �޼ҵ�
   public int totalcount() {
      int result = 0;
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         //�����ͺ��̽� ���� ����
         conn = MySQLConnection80.connect();

         //���� ���ڿ�
         //����) ������ ���� ; ����� �Ѵ�.
         String sql = "SELECT COUNT(*) totalcount FROM score";
   
      
         pstmt = conn.prepareStatement(sql);
   
         ResultSet rs = pstmt.executeQuery();
         
         //���� ��� �м�
         while(rs.next()) {
            result = rs.getInt("totalcount");
         }
         
         rs.close();
         
      } catch (Exception e) {
         //������ �ܼ�â�� �޽��� ���
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