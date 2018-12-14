package com.test;

import java.sql.*;
import java.util.*;

import com.connection.MySQLConnection80;

public class LoginDAO {

	// Ãâ·Â
	public Login login(String id_, String pw) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		Login result = null;

		try {

			conn = MySQLConnection80.connect();

			String sql = "SELECT id_ FROM admin_ WHERE id_ = ? AND pw = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id_);
			pstmt.setString(2, pw);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String id = rs.getString("id_");
				
				result = new Login(id, null);


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
}
