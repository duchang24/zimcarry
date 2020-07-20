<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<jsp:useBean id="ReseDTO" class="com.zimcarry.reservation.ReservationDTO"/>
<jsp:useBean id="ReseDAO" class="com.zimcarry.reservation.ReservationDAO"/>
<c:set var="name1" value="${param.name1}"/>
<c:set var="phone1" value="${param.phone2}"/>
${ name1} // ${phone1 }
<c:set var="Reser_List" value="${ReseDAO.selectJoin(name1,phone1)}"/>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="reservation sub_content_wrap">
		<div class="sub_title box_inner">
			짐없는 여행의 시작<br>
			<span>짐캐리 예약자 조회</span>
		</div>
		<div class="white">
			<c:forEach var="item" items="${Reser_List}" varStatus="status">

			<p>예약 번호:${item.bIdx}</p>
			<p>예약자 이름:${item.bName}</p>
			<p>예약자 휴대전화번호:${item.bHp}</p>
			<p>이동 구간:${item.bStart} -> ${item.bEnd}</p>
			<p>예약 날짜 :${item.bBookingdate}</p>
			<p>물건 찾으시는 날짜${item.bStartdate}</p>
			<p>찾으시는 시간:${item.bEnddate}</p>
			<p>26인치 이상 물건:${item.bOver26}</p>
			<p>26인치 이하 물건 :${item.bUnder26}</p> 
			<p>총 금액:${item.bPrice}</p>
			</c:forEach>
			<input type="button" id="btninput" value="예약취소"onclick="popup();">
			<input type="button" id="btninput" value="돌아가기"onclick="location.href='2.jsp'">
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