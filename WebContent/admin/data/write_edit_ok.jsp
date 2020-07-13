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
	int maxSize = 100 * 1024 * 1024;
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	int read = 0;
	byte[] buf = new byte[1024];
	
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
	String noTitle = multi.getParameter("noTitle");
	String noWriter = multi.getParameter("noWriter");
	String noContent = multi.getParameter("noContent");
	uploadFile = multi.getFilesystemName("noFile");
	String noHidden = multi.getParameter("noHidden");
	String noIdx = multi.getParameter("noIdx");
	
	File file = new File(savePath + "/" + uploadFile);
	if (!file.exists()) {
		System.out.println("디렉토리 없음");
		file.mkdir();
	}
	System.out.println("file : " + file);
	
%>



<c:if test="${empty param.noTitle}" >
	<script>
		alert('잘못된 접근입니다.');
		location.href='../notice.jsp';
	</script>
</c:if>
<c:if test="${not empty param.btn_write and param.btn_write == '작성'}" >
	<c:if test="${noticeDAO.insertNotice(noticeDTO) eq 'true'}" >
		<script>
			alert('공지사항 작성 성공');
			location.href='../notice.jsp';
		</script>
	</c:if>
	<script>
		alert('공지사항 작성 실패');
		history.back();
	</script>
</c:if>
<c:if test="${not empty param.btn_edit and param.btn_edit == '수정'}" >
	<c:if test="${noticeDAO.editNotice(noticeDTO) eq 'true'}" >
		<script>
			alert('공지사항 수정 성공');
			location.href='../notice.jsp';
		</script>
	</c:if>
	<script>
		alert('공지사항 수정 실패');
		history.back();
	</script>
</c:if>