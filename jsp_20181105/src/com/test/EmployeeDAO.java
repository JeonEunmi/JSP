package com.test;

import java.util.*;

import com.connection.MySQLConnection80;

import java.sql.*;

//(�����ͺ��̽�)����� � Ŭ����
public class EmployeeDAO {

	//��� �� �˻� �޼ҵ�
	public List<Employee> list(String key, String value) {
		List<Employee> result = new ArrayList<Employee>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//�����ͺ��̽� ���� ����
			conn = MySQLConnection80.connect();

			//���� ���ڿ�
			//����) ������ ���� ; ����� �Ѵ�.
			String sql = "SELECT id_, age, first_, last_  FROM  employees\r\n";
			if (key.equals("all")) {
				sql += "";
			} else if (key.equals("id_")){
				sql += "WHERE id_=?\r\n";
			} else if (key.equals("age")){
				sql += "WHERE age=?\r\n";
			} else if (key.equals("first_")){
				//MySQL������ ��ҹ��� ���о��� �˻� ����
				sql += "WHERE first_=?\r\n";
			} else if (key.equals("last_")){
				//MySQL������ ��ҹ��� ���о��� �˻� ����
				sql += "WHERE last_=?\r\n";
			}
			sql += "ORDER BY id_";
			
			//���� ����
			pstmt = conn.prepareStatement(sql);
			if (key.equals("all")) {
			} else if (key.equals("id_") || key.equals("age")){
				//JDBC���� �����͹��ε� �ε����� 1���� ���۵�
				pstmt.setInt(1, Integer.parseInt(value));
			} else if (key.equals("first_") || key.equals("last_")){
				pstmt.setString(1, value);
			}
			ResultSet rs = pstmt.executeQuery();
			
			//���� ��� �м�
			while(rs.next()) {
				int id_ = rs.getInt("id_");
				int age = rs.getInt("age");
				String first_ = rs.getString("first_");
				String last_ = rs.getString("last_");
				
				//����) ResultSet ��ü�� ���� �޼ҵ� ������ ��� �� ����
				//ResultSet ��ü -> �÷��� ��ü�� ���簡 �ʿ��ϴ�
				//�÷��� ����ҿ� Employee ��ü�� �����ϴ� �׼� �߰�				
				result.add(new Employee(id_, age, first_, last_));
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
			
			String sql = "SELECT COUNT(*) totalcount FROM employees";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
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
	
	//�ڷ� ���� �޼ҵ�
	//->�Ű������� Employee �ڷ��� ����
	public int add(Employee emp) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//�����ͺ��̽� ���� ����
			conn = MySQLConnection80.connect();	
			
			//�ܺο��� ���޵� �ڷḦ ���ε��ϱ� ���ؼ� ? ���
			String sql = "INSERT INTO Employees (id_, age, first_, last_) \r\n" + 
					"	VALUES (?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			//PreparedStatemt ��ü���� 
			//������ ���ε��� 1���� �ε��� ����
			pstmt.setInt(1, emp.getId_());
			pstmt.setInt(2, emp.getAge());
			pstmt.setString(3, emp.getFirst_());
			pstmt.setString(4, emp.getLast_());
			//DML�� ������ executeUpdate() �޼ҵ� ���
			//->��ȯ���� ������� ���� ����
			result = pstmt.executeUpdate();
		
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
		return result; //0(����) �Ǵ� 1(����) ��ȯ
	}
	
}
