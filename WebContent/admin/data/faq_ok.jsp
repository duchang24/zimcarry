<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO" />
<jsp:useBean id="faqDTO" class="com.zimcarry.faq.FaqDTO" />
<jsp:setProperty property="*" name="faqDTO" />
<c:if test="${param.edit ne null}" >
	<c:if test="${faqDAO.editFAQ(faqDTO)}" >
		<script>
			alert('FAQ 수정 성공!');
			location.href='../faq.jsp';
		</script>
	</c:if>
	<script>
		alert('FAQ 수정 실패!');
		history.back();
	</script>
</c:if>
<c:if test="${param.write ne null}" >
	<c:if test="${faqDAO.insertFAQ(faqDTO)}" >
		<script>
			alert('FAQ 작성 성공!');
			location.href='../faq.jsp';
		</script>
	</c:if>
	<script>
		alert('FAQ 작성 실패!');
		history.back();
	</script>
</c:if>