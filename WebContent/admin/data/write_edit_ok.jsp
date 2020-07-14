<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ page import="com.zimcarry.util.FileService"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="noticeDAO" class="com.zimcarry.notice.NoticeDAO" />
<jsp:useBean id="noticeDTO" class="com.zimcarry.notice.NoticeDTO" />
<jsp:setProperty property="*" name="noticeDTO" />
<%
	FileService fs = new FileService();
	fs.setRealPath(request.getRealPath("uploads"));
	int maxSize = 100 * 1024 * 1024;
	String savePath = fs.getRealPath();
	String format = "UTF-8";
	String uploadFile = "";
	int read = 0;
	byte[] buf = new byte[1024];
	
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
	String noTitle = multi.getParameter("noTitle");
	String noWriter = multi.getParameter("noWriter");
	String noContent = multi.getParameter("noContent");
	uploadFile = multi.getFilesystemName("noFilename");
	String noHidden = multi.getParameter("noHidden");
	String noIdx = multi.getParameter("noIdx");
	
	System.out.println("업로드된 파일" + uploadFile);
	
	File file = new File(savePath + "/" + uploadFile);
	if (!file.exists()) {
		System.out.println("파일 또는 디렉토리 없음");
		file.mkdir();
	}
	System.out.println("file : " + file);
	
	String btn = "";
	
	if (multi.getParameter("btn_write") != null) {
		btn = multi.getParameter("btn_write");
	} else if (multi.getParameter("btn_edit") != null) {
		btn = multi.getParameter("btn_edit");
	}
	System.out.println("btn" + btn);
	
	if (btn.equals("작성")) {
		System.out.println("결과 - 작성");
		if (uploadFile != null) {
			fs.insertFileNotice(noTitle, noWriter, noContent, noHidden, file);
		} else {
			noticeDAO.insertNotice(noTitle, noWriter, noContent, noHidden);
		}
	} else {
		System.out.println("결과 - 수정");
		
	}
	
%>
