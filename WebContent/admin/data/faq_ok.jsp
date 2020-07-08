<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO" />
<c:if test="${not empty faqDAO.faqDataToJSON(param.fIdx)}" >
	${faqDAO.faqDataToJSON(param.fIdx)}
</c:if>