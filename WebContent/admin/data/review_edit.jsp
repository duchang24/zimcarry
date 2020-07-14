<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<%
	String re_idx = request.getParameter("re_idx");
%>
<c:set var="re_idx" value="<%=re_idx %>" />
<c:choose>
	<c:when test="${reviewDTO.reHidden eq 'n'}">
		<c:set var="review_show" value="${ reviewDAO.review_show(re_idx) }" />
		<c:if test="${ review_show ne 0 }">
			<script>
				alert("공개여부가 정상적으로 수정되었습니다.");
				locarion.href="../review.jsp";
			</script>
		</c:if>
	</c:when>
	<c:when test="${reviewDTO.reHidden eq 'y'}">
		<c:set var="review_hide" value="${ reviewDAO.review_show(re_idx) }" />
		<c:if test="${ review_hide ne 0 }">
			<script>
				alert("공개여부가 정상적으로 수정되었습니다.");
				locarion.href="../review.jsp";
			</script>
		</c:if>
	</c:when>
</c:choose>


	
