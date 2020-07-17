package com.zimcarry.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import com.zimcarry.db.DBConn;

public class ReservationDAO {
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public ReservationDAO() {}
	
	public boolean insertBoard(ReservationDTO r_DTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			String sql = "INSERT INTO tb_book(b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_over26, b_under26, b_price) "
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_DTO.getbName());
			pstmt.setString(2, r_DTO.getbHp());
			pstmt.setString(3, r_DTO.getbStart());
			pstmt.setString(4, r_DTO.getbEnd());
			pstmt.setString(5, format.format(r_DTO.getbStartdate()));
			pstmt.setString(6, format.format(r_DTO.getbEnddate()));
			pstmt.setInt(7, r_DTO.getbOver26());
			pstmt.setInt(8, r_DTO.getbUnder26());
			pstmt.setInt(9, r_DTO.getbPrice());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("성공");
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
}
