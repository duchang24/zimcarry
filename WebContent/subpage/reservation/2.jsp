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
<link href="../../css/rs2.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/reservation.js"></script>

</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="reservation sub_content_wrap">
		<div class="sub_title box_inner">
			짐없는 여행의 시작<br>
			<span>짐캐리</span>
		</div>
		<div class="white">
			<div id="sub_content" class="box_inner sub_content">
				<nav class="sub_navi">
					<ul>
						<li><a href="1.jsp">예약하기</a></li>
						<li><a href="2.jsp">조회하기</a></li>
					</ul>
				</nav>
				<div class="sub_indicator box_inner">
					<h2>조회하기</h2>
					<ul>
						<li>Home</li>
						<li>조회</li>
						<li>조회하기</li>
					</ul>
				</div>	
		
			<form action="#" name="my_form" id="form-2">
				<input type="text" name="name1" placeholder="이름">
				<input type="text" name="phone2" id="phone2" placeholder="휴대폰 번호"> 
				<input type="button" id="btninput" value="휴대폰인증"onclick="popup();">
				<input type="hidden" name="ck_phone" value="no" id="isIdCheck">
				<input type="submit" id="btninput" value="조회하기">
			</form>
			</div>
		</div>
	</div>
	
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
	<script src="../../js/main.js"></script>
	
	<!-- footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp"%>
	<!-- pop-up end -->
</body>
</html>