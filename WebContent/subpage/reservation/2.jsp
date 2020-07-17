<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>조회하기</title>
<link href="../../css/common.css" rel="stylesheet">
<link href="../../images/ico_tit.ico" rel="shortcut icon"
	type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald:400,500"
	rel="stylesheet">
<link href="../../css/rs_Form.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/reservation.js"></script>

</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="contant" name="contant" id="contant"></div>
	<form action="./2.jsp" name="my_form" id="form-2">
		<button type="button" class="first button"
			onclick="location.href='1.jsp'">예약하기</button>
		<button type="button" class="second button"
			onclick="location.href='2.jsp'">조회하기</button>
		<h1>조회하기</h1>
		<input type="text" name="bName" placeholder="이름"><br>
		<p>
			<input type="text" name="bHp" id="phone2" placeholder="휴대폰 번호"> <input
				type="button" id="btnphone" value="휴대폰인증"
				onclick="popup();">
		</p>
		<input type="hidden" name="ck_phone" value="no" id="isIdCheck">
		<input type="submit" value="조회하기">
	</form>
	<!-- footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp"%>
	<!-- pop-up end -->
</body>
</html>