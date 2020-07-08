package com.zimcarry.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
<<<<<<< HEAD
import java.sql.SQLException;
=======
>>>>>>> 472f9cb63f3766aad57e3349f9a9ced8eec2fd5d
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

	public boolean insertReview(ReviewDTO reviewDTO) {
		try {
			String sql = "INSERT INTO tb_review(re_score, re_title, re_content, re_bookidx) VALUES(?, ?, ?, ?)";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, reviewDTO.getReScore());
			pstmt.setString(2, reviewDTO.getReTitle());
			pstmt.setString(3, reviewDTO.getReContent().trim());
			pstmt.setLong(4, reviewDTO.getReBookidx());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				sql = "UPDATE tb_book SET b_isreview = ? WHERE b_idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "y");
				pstmt.setLong(2, reviewDTO.getReBookidx());
				result = pstmt.executeUpdate();
				if (result > 0) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
	
	public List<ReviewDTO> selectReviewList() {
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		try {
			String sql = "SELECT re_idx, re_score, re_title, re_content, re_writedate, re_bookidx FROM tb_review";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setReIdx(rs.getLong("re_idx"));
				reviewDTO.setReScore(rs.getDouble("re_score"));
				reviewDTO.setReTitle(rs.getString("re_title"));
				reviewDTO.setReContent(rs.getString("re_content"));
				reviewDTO.setReWritedate(rs.getDate("re_writedate"));
				reviewDTO.setReBookidx(rs.getLong("re_bookidx"));
				reviewList.add(reviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}
}















