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
	
	public List<NoticeDTO> getNoticeList() {
		
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT no_idx, no_title, no_writer, no_writedate, no_hit, no_hidden FROM tb_notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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
