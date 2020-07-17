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
					<h2>예약하기</h2>
					<ul>
						<li>Home</li>
						<li>예약</li>
						<li>예약하기</li>
					</ul>
				</div>

			<form action="1_ok.jsp" type="post" name="my_form" id="form-1" > 
				<input type="text" name="name2" id="name2" placeholder="이름을 입력하세요.">
				<input type="text" name="phone2" id="phone2" placeholder="휴대폰 (예) 010-9326-3421">
				<input type="button" id="btninput" value="휴대폰인증" onclick="popup();">
				<input type="hidden" name="ck_phone" value="no" id="isIdCheck">
				
				
				<h1 id="h1">구간 선택</h1>
				<div id="box_bd">
					<select name="b_start" id="select_op">
						<option value="">맡기는 장소</option>
						<option value="부산역">부산역</option>
						<option value="숙소">숙소</option>
						<option value="벡스코">숙소</option>
					</select> 
					<select name="b_end" id="select_op">
						<option value="">찾는 장소</option>
						<option value="부산역">부산역</option>
						<option value="숙소">숙소</option>
						<option value="벡스코">숙소</option>
					</select>
				<input type="text" name="bBookingdate" id="Datepickerstart"placeholder="YYYY-MM-DD">
				</div>

				<h1 id="h1">맡길 시간</h1>
				<div id="box_bd">
					<select name="bBookingtime1" id="select_op">
						<option value="">시 선택</option>
						<option value="9">오전 9시</option>
						<option value="10">오전 10시</option>
						<option value="11">오전 11시</option>
						<option value="12">오후 12시</option>
						<option value="14">오후 1시</option>
						<option value="15">오후 2시</option>
					</select> 
					<select name="bBookingtime2" id="select_op">
						<option value="">분 선택</option>
						<option value="0">0분</option>
						<option value="10">10분</option>
						<option value="20">20분</option>
						<option value="30">30분</option>
						<option value="40">40분</option>
						<option value="50">50분</option>
					</select>
					<input type="text" name="bBookingdateend" id="Datepickerend" placeholder="찾는 날짜를 입력하세요.">
				</div>

				<h1 id="h1">26인치 이상 수하물</h1>
				<div id="box_bds">
					<input type="text" name="bOver26" id="bOver26" class="input_sht" placeholder="수량을 입력하세요.">
				</div>

				<h1 id="h1">26인치 이하 수하물</h1>
				<div id="box_bds">
					<input type="text" name="bUnder26" id="bUnder26" class="input_sht" placeholder="수량을 입력하세요.">
				</div>

				<h1 id="h1">총 금액</h1>
				<div id="box_bds">
					<input type="text" name="bPrice" id="bPrice" class="input_sht" placeholder="수량을 입력하세요."> 
				</div>

				<input id="btninput" type="button" value="예약하기" onclick="chkform()">
			</form>
			</div>
		</div>
	</div>
	<script src="../../js/rs_Form.js" type="text/javascript"></script>
	<!-- footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp"%>
	<!-- pop-up end -->
</body>
</html>