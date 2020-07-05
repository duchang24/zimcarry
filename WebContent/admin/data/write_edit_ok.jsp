<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="noticeDAO" class="com.zimcarry.notice.NoticeDAO" />
<c:if test="${empty param.no_title}" >
	<script>
		alert('잘못된 접근입니다.');
		location.href='../notice.jsp';
	</script>
</c:if>

<c:if test="${not empty param.btn_write and param.btn_write == '작성'}" >
	<h2>작성 로직</h2>
</c:if>

<c:if test="${not empty param.btn_edit and param.btn_edit == '수정'}" >
	<h2>수정 로직</h2>
</c:if>
