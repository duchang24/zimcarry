<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	String temp = request.getParameter("fIdx");
	String fHidden = request.getParameter("fHidden");
	int fIdx = Integer.parseInt(temp);

	faqDAO.hidden(fIdx, fHidden);
%>