<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<%
	String re_idx = request.getParameter("re_idx");
	String re_hidden = request.getParameter("review_hv");
%>
<c:set var="re_idx" value="<%=re_idx%>" />
<c:set var="re_hidden" value="<%=re_hidden%>" />
<c:choose>
	<c:when test="${re_hidden eq 'n'}">
		<c:set var="review_show" value="${ reviewDAO.review_show(re_hidden, re_idx) }" />
		<c:if test="${ review_show eq 1 }">
			<script>
				alert("공개여부가 정상적으로 수정되었습니다.");
				locarion.href="../review.jsp";
			</script>
		</c:if>
	</c:when>
	<c:when test="${reHidden eq 'y'}">
		<c:set var="review_hide" value="${ reviewDAO.review_show(re_hidden, re_idx) }" />
		<c:if test="${ review_hide eq 1 }">
			<script>
				alert("공개여부가 정상적으로 수정되었습니다.");
				locarion.href="../review.jsp";
			</script>
		</c:if>
	</c:when>
</c:choose>


	
