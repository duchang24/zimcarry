<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기</title>
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
	<div class="contant" name="contant" id="contant">
	</div>
		<form action="1_ok.jsp" method="POST" name="my_form" id="form-1">
			<button type="button" class="second button"
				onclick="location.href='1.jsp'">예약하기</button>
			<button type="button" class="first button"
				onclick="location.href='2.jsp'">조회하기</button>
			<h1>예약하기</h1>
			<input type="text" name="bName" id="name2" placeholder="Set A name">
			<p>
				<input type="text" name="bHp" id="phone2"
					placeholder="Set A phone(예) 010-9326-3421)"><input
					type="button" id="btnphone" value="휴대폰인증"
					onclick="popup();">
			</p>
			<input type="hidden" name="ck_phone" value="no" id="isIdCheck">
			<div id="start_end" >
				<h1>구간선택</h1>
				<select name="bStart">
					<option value="">맡기는 장소</option>
					<option value="부산역">부산역</option>
					<option value="숙소">숙소</option>
					<option value="벡스코">벡스코</option>
				</select> <select name="bEnd">
					<option value="">찾는 장소</option>
					<option value="부산역">부산역</option>
					<option value="숙소">숙소</option>
					<option value="벡스코">벡스코</option>
				</select>
			</div>
			<input type="text" name="bBookingdate1" id="Datepickerstart"
				placeholder="YYYY-MM-DD">
			<p>
			<h1>맡길 시간</h1>
			<select name="bStartdate1">
				<option value="">시 선택</option>
				<option value="9">오전 9시</option>
				<option value="10">오전 10시</option>
				<option value="11">오전 11시</option>
				<option value="12">오후 12시</option>
				<option value="14">오후 1시</option>
				<option value="15">오후 2시</option>
			</select> <select name="bStartdate2">
				<option value="">분 선택</option>
				<option value="0">0분</option>
				<option value="10">10분</option>
				<option value="20">20분</option>
				<option value="30">30분</option>
				<option value="40">40분</option>
				<option value="50">50분</option>
			</select>
			</p>
			<input type="text" name="bBookingdateend" id="Datepickerend"
				value="YYYY-MM-DD">
			<!--p>
			<h1>찾는 시간</h1>
			<select name="bBookingtime1" >
			<option value="">시 선택</option>
				<option value="9">오전 9시</option>
				<option value="10">오전 10시</option>
				<option value="11">오전 11시</option>
				<option value="12">오후 12시</option>
				<option value="14">오후 1시</option>
				<option value="15">오후 2시</option>
			</select>
		<select name="bBookingtime2" >
			<option value="">분 선택</option>
				<option value="0">0분</option>
				<option value="10">10분</option>
				<option value="20">20분</option>
				<option value="30">30분</option>
				<option value="40">40분</option>
				<option value="50">50분</option>
			</select>
		</p-->
			<h1>26인치 이상 수하물</h1>
			<input type="text" name="bOver26" id="bOver26" value="0">
			<h1>26인치 이하 수하물</h1>
			<input type="text" name="bUnder26" id="bUnder26" value="0">
			<h1>금액 :</h1>
			<input type="text" name="bPrice" id="bPrice" value="0"> 
			<input id="r_submit" type="submit" value="예약하기" onclick="chkform()">
		</form>


	<script src="../../js/rs_Form.js" type="text/javascript"></script>
	<!-- footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp"%>
	<!-- pop-up end -->
</body>
</html>