package com.zimcarry.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zimcarry.db.DBConn;

public class ReviewDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public List<ReviewDTO> getReviewList() {
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		ReviewDTO review = null;
		conn = DBConn.getConnection();
		String sql = "SELECT re_idx, re_title, re_score, re_content, re_writedate FROM tb_review WHERE order by re_idx desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review = new ReviewDTO();
				review.setReIdx(rs.getLong("re_idx"));
				review.setReTitle(rs.getString("re_title"));
				review.setReScore(rs.getDouble("re_score"));
				review.setReContent(rs.getString("re_content"));
				review.setReWritedate(rs.getDate("re_writedate"));
				reviewList.add(review);
			}
			sql = "SELECT b_name, b_start, b_end FROM tb_book WHERE b_idx=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setLong(1, review.getReBookIdx());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review.setReWriter(rs.getString("b_name"));
				review.setReRoute(rs.getString("b_start") + "→" + rs.getString("b_end"));
				reviewList.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return reviewList;
	}
	public boolean insertReview() {
		conn = DBConn.getConnection();
		String sql = "INSERT INTO (re_hp, re_title, re_content, re_score, re_writedate, re_bookIdx) VALUES"
				+ "(?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1,  );
	}
	
}















