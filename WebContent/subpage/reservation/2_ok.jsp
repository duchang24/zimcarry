<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="reserDTO" class="com.zimcarry.reservation.reser_DTO"/>
<jsp:setProperty property="*" name="reserDTO"/>
<jsp:useBean id="reserDAO" class="com.zimcarry.reservation.reser_DAO"/>

<%

	int rows = reserDAO.insertBoard(reserDTO);
	if(rows >= 1){
%>
	<script>
		alert("예약이 등록되었습니다.");
		location.href="list.jsp";
	</script>
<%
	}else{
%>
	<script>
	alert("예약 등록 실패하였습니다.");
	history.back();
	</script>
<%
	}
%>
<body>
</body>
</html>