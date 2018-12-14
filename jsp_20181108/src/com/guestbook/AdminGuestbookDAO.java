package com.guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.connection.MySQLConnection80;
import com.picture.Picture;

public class AdminGuestbookDAO {


	public List<Guestbook> adminList() {

		/*
		 * 일반 사용자 전체출력 ->블라인드 처리 게시물 제외 SELECT gid, name_, content, regDate FROM
		 * guestbook WHERE blind = 0;
		 */
		Connection conn = null;
		PreparedStatement pstmt = null;

		List<Guestbook> result = new ArrayList<Guestbook>();

		try {

			conn = MySQLConnection80.connect();

			String sql = "SELECT gid, name_, content, DATE_FORMAT(regDate, '%Y-%m-%d') regDate FROM guestbook guestbook WHERE blind = 0";

			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				String gid = rs.getString("gid");
				String name_ = rs.getString("name_");
				String content = rs.getString("content");
				String regDate = rs.getString("regDate");

				result.add(new Guestbook(gid, name_, content, regDate));
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

	// 전체 카운트 메소드
	public int totalcount() {
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 데이터베이스 연결 설정
			conn = MySQLConnection80.connect();

			// 쿼리 문자열
			// 주의) 쿼리문 끝에 ; 없어야 한다.
			String sql = "SELECT COUNT(*) totalcount FROM guestbook";

			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			// 쿼리 결과 분석
			while (rs.next()) {
				result = rs.getInt("totalcount");
			}

			rs.close();

		} catch (Exception e) {
			// 서버의 콘솔창에 메시지 출력
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
