<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@	page import="com.zimcarry.notice.NoticeDAO" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<%
	NoticeDAO noticeDAO = new NoticeDAO();
	String search = request.getParameter("search_title");
	String keyword = request.getParameter("search_content");
%>
