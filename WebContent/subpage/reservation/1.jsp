<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
	<link href="../../css/common.css" rel="stylesheet">
	<link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald:400,500" rel="stylesheet">
    <link href="../../css/rs_Form.css" type="text/css" rel="stylesheet">
    
</head>
<body>
    <%@ include file="../../common/header.jsp" %>
	<div class="contant" name="contant" id="contant">
		<form action="/js/join.jsp" name="my_form" id="form-1">
		<button class="first button">예약하기</button> 
		<button class="second button">조회하기</button>
		<h1>조회하기</h1>
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="phone" placeholder="휴대폰 번호">
		<input type="submit" value="조회하기">
		</form>


		<form action="#" name="my_form" id="form-2" class="visibility">
		<button class="second button">Sign Up</button> 
		<button class="first button">Login In</button>
		<h1>Sign Up for Free</h1>
		<input type="text" name="name1" placeholder="Set A name">
		<p><input type="text" name="phone" placeholder="Set A phone(예) 010-9326-3421)"><input type="button" id="btnssn" value="휴대폰인증"></p>
        <input type="hidden" name="isSsnCheck" id="isSsnCheck" value="no" id="isssn">
		<%
			String btnssn = request.getParameter("isSsnCheck");

			if(request.getParameter("isSsnCheck")=="true")
			{
				%>
				<input type="text" name="ssn_ok" id="ssn_ok" value="%><%=btnssn%>">
				<%
			}
		%>
		<input type="submit" value="가입하기">
		</form>
	</div>

    <script src="../../js/rs_Form.js" type="text/javascript"></script>
    	<!-- footer -->
   		<%@ include file="../../common/footer.jsp" %>
   		<!-- footer end -->
   		<!-- pop-up -->
   		<%@ include file="../../common/popup.jsp" %>
   		<!-- pop-up end -->
</body>
</html>