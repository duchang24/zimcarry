<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="noticeDAO" class="com.zimcarry.notice.NoticeDAO" />
<jsp:useBean id="noticeDTO" class="com.zimcarry.notice.NoticeDTO" />
<jsp:setProperty property="*" name="noticeDTO" />
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