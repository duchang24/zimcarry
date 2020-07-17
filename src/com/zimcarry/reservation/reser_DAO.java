package com.zimcarry.reservation;

import java.sql.*;
import java.text.SimpleDateFormat;

import com.zimcarry.db.DBConn;

public class reser_DAO {
	
	public reser_DAO()
	{
		
	}
	
	public Integer insertBoard(reser_DTO r_DTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {

			conn = DBConn.getConnection();
			String sql = "INSERT INTO tb_book(b_name, b_hp, b_start, b_end, b_bookingdate, b_startdate, b_enddate, b_over26, b_under26, b_price) "
					+ " values (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_DTO.getbName());
			pstmt.setString(2, r_DTO.getbHp());
			pstmt.setString(3, r_DTO.getbStart());
			pstmt.setString(4, r_DTO.getbEnd()));
			pstmt.setDate(5, r_DTO.getbBookingdate());
			pstmt.setDate(6, r_DTO.getbStartdate());
			pstmt.setDate(7, r_DTO.getbEnddate());
			pstmt.setInt(8, r_DTO.getbOver26());
			pstmt.setInt(9, r_DTO.getbUnder26());
			pstmt.setInt(10, r_DTO.getbPrice());
			rows = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return rows;
	}

}
