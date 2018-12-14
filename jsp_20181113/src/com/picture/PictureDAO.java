package com.picture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connection.MySQLConnection80;;

public class PictureDAO {

	public List<Picture> pictureList() {

		Connection conn = null;
		PreparedStatement pstmt = null;

		List<Picture> result = new ArrayList<Picture>();

		try {

			conn = MySQLConnection80.connect();

			String sql = "SELECT pid, filename, content FROM picturelist ORDER BY pid";

			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				String pid = rs.getString("pid");
				String filename = rs.getString("filename");
				String content = rs.getString("content");
				
				result.add(new Picture(pid, filename, content));
			}

			rs.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se2) {
				se2.printStackTrace();
			}

			try {
				MySQLConnection80.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}
	

	public int pictureADD(Picture p) {

		int result = 0;

		// INSERT INTO pictureList (pid, filename, content) VALUES((��ȣ�ڵ�������������), ?, ?);

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection80.connect();
			String sql = "INSERT INTO pictureList (pid, filename, content) VALUES((SELECT CONCAT('P', LPAD(IFNULL(SUBSTR(MAX(pid), 2), 0) + 1, 2, 0)) AS pid FROM pictureList p), ?, ?);";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getFilename()); // �������� ? �� �ִٸ� ? �� �� ��Ҹ� ����
			pstmt.setString(2, p.getContent());

			result = pstmt.executeUpdate(); // SELECT ���� ������ INSERT, UPDATE, DELETE � ����ϴ� ����
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close(); // �������� ���������� ��� pstmt�� ������ ����
			} catch (SQLException se2) {
				se2.printStackTrace();
			}
			try {
				MySQLConnection80.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;

	}

	public int pictureRemove(String pid) {

		
		System.out.println(pid);
		Connection conn = null;
		PreparedStatement pstmt = null;

		int rs = 0;

		try {
			conn = MySQLConnection80.connect();
			String sql = "DELETE FROM picturelist \r\n" + "    WHERE UPPER(pid) = UPPER(?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			rs = pstmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se2) {
				se2.printStackTrace();
			}
			try {
				MySQLConnection80.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return rs;

	}
}
