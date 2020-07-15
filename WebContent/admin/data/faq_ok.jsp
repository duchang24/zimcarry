<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO" />
<jsp:useBean id="faqDTO" class="com.zimcarry.faq.FaqDTO" />
<jsp:setProperty property="*" name="faqDTO" />
<c:if test="${faqDAO.regFAQ()}" >

</c:if>