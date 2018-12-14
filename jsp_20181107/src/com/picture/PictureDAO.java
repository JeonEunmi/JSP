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

			String sql = "SELECT pid, filename, content, caption FROM picturelist ORDER BY pid";

			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				String pid = rs.getString("pid");
				String filename = rs.getString("filename");
				String content = rs.getString("content");
				String caption = rs.getString("caption");
				
				result.add(new Picture(pid, filename, content, caption));
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
