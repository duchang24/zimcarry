package com.zimcarry.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

import com.zimcarry.db.DBConn;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public boolean insertNotice(NoticeDTO noticeDTO) {
		try {
			conn = DBConn.getConnection();
			String sql = "INSERT INTO tb_notice (no_title, no_content, no_writer, no_file, no_hidden) VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeDTO.getNoTitle());
			pstmt.setString(2, noticeDTO.getNoContent());
			pstmt.setString(3, noticeDTO.getNoWriter());
			pstmt.setString(4, noticeDTO.getNoFile());
			pstmt.setString(5, noticeDTO.getNoHidden());
			if (pstmt.executeUpdate() > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return false;
	}
	
	public boolean editNotice(NoticeDTO noticeDTO) {
		try {
			conn = DBConn.getConnection();
			if (noticeDTO.getNoFile() == null || noticeDTO.getNoFile().equals("")) {
				String sql = "UPDATE tb_notice SET no_title = ?, no_content = ?, no_writer = ?, no_hidden = ? WHERE no_idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeDTO.getNoTitle());
				pstmt.setString(2, noticeDTO.getNoContent());
				pstmt.setString(3, noticeDTO.getNoWriter());
				pstmt.setString(4, noticeDTO.getNoHidden());
				pstmt.setLong(5, noticeDTO.getNoIdx());
			} else {
				String sql = "UPDATE tb_notice SET no_title = ?, no_content = ?, no_writer = ?, no_file = ?, no_hidden = ? WHERE no_idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, noticeDTO.getNoTitle());
				pstmt.setString(2, noticeDTO.getNoContent());
				pstmt.setString(3, noticeDTO.getNoWriter());
				pstmt.setString(4, noticeDTO.getNoFile());
				pstmt.setString(5, noticeDTO.getNoHidden());
				pstmt.setLong(6, noticeDTO.getNoIdx());
			}
			if (pstmt.executeUpdate() > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return false;
	}
	
	
	public List<NoticeDTO> getNoticeList(String allList) {
		
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT no_idx, no_title, no_writer, no_writedate, no_hit, no_hidden FROM tb_notice ORDER BY no_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (allList.equals("yes")) {
				while (rs.next()) {
					NoticeDTO notice = new NoticeDTO();
					notice.setNoIdx(rs.getLong("no_idx"));
					notice.setNoTitle(rs.getString("no_title"));
					notice.setNoWriter(rs.getString("no_writer"));
					notice.setNoWritedate(rs.getDate("no_writedate"));
					notice.setNoHit(rs.getLong("no_hit"));
					notice.setNoHidden(rs.getString("no_hidden"));
					noticeList.add(notice);
				}
			} else if (allList.equals("no")) {
				while (rs.next()) {
					if (rs.getString("no_hidden").equals("n")) {
						NoticeDTO notice = new NoticeDTO();
						notice.setNoIdx(rs.getLong("no_idx"));
						notice.setNoTitle(rs.getString("no_title"));
						notice.setNoWriter(rs.getString("no_writer"));
						notice.setNoWritedate(rs.getDate("no_writedate"));
						notice.setNoHit(rs.getLong("no_hit"));
						notice.setNoHidden(rs.getString("no_hidden"));
						noticeList.add(notice);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return noticeList;
	}
	
	@SuppressWarnings("unchecked")
	public String noticeDataToJSON(String no_idx) {
		String no_title = "", no_content = "", no_writer = "", no_writedate = "", no_hit = "", no_file = "", no_hidden = "";
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT no_title, no_content, no_writer, no_writedate, no_hit, no_file, no_hidden FROM tb_notice WHERE no_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no_idx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				no_title = rs.getString("no_title");
				no_content = rs.getString("no_content");
				no_writer = rs.getString("no_writer");
				no_writedate = rs.getString("no_writedate");
				no_hit = rs.getString("no_hit");
				no_file = rs.getString("no_file");
				no_hidden = rs.getString("no_hidden");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		JSONObject jobj = new JSONObject();
		jobj.put("no_title", no_title);
		jobj.put("no_content", no_content);
		jobj.put("no_writer", no_writer);
		jobj.put("no_writedate", no_writedate);
		jobj.put("no_hit", no_hit);
		jobj.put("no_file", no_file);
		jobj.put("no_hidden", no_hidden);
		
		return jobj.toString();
	}
	
}
