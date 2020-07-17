package com.zimcarry.util;

import java.util.Calendar;

import com.zimcarry.notice.NoticeDAO;

public class FileService {

	private NoticeDAO noticeDAO = null;
	public static String SAVE_PATH = "C:/uploads/";
	
	public void FileService() {
		noticeDAO = new NoticeDAO();
	}
	
	public static String getToday() {
		Calendar c = Calendar.getInstance();
		return null;
	}
}
