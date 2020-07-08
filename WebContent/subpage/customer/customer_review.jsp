<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />

<c:set var="reviewList" value="${reviewDAO.getReviewList()}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
    <title>짐 없는 여행의 시작! 짐캐리</title>
    <link href="../../css/customer_center_style.css" rel="stylesheet">
    <link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<%@ include file="../../common/header.jsp" %>
		<!-- header end -->
		<!-- content -->
		<div class="customer sub_content_wrap">
            <div class="sub_title box_inner">
                짐없는 여행의 시작<br>
                <span>짐캐리</span>
            </div>
            <div class="white">
                <div id="sub_content" class="box_inner sub_content">
                    <nav class="sub_navi">
                        <ul>
                            <li><a href="./customer_notice.jsp">공지사항</a></li>
                            <li><a href="./customer_FAQ.jsp">FAQ</a></li>
                            <li><a href="./customer_review.jsp" class="on">이용후기</a></li>
                        </ul>
                    </nav>
                    <div class="sub_indicator box_inner">
                        <h2>이용후기</h2>
                        <ul>
                            <li>Home</li>
                            <li>고객센터</li>
                            <li>이용후기</li>
                        </ul>
                    </div>
                    <div class="review_area box_inner">
                        <div class="btn_wrap">
                            <button class="btn_base btn_yellow">이용후기 작성</button>
                        </div>
                        <h3>짐캐리 이용고객 후기</h3>
                        <ul class="review_list">
                        	<c:forEach var="review" items='${ reviewList }' varStatus="status">
	                            <li>
	                                <div class="review_content">
	                                    <span class="name">${ review.reWriter }</span><span class="root">${ review.reRoute }</span><span class="use_date">${ review.reWritedate }</span>
	                                    <p class="star five">${ review.reScore }</p>
	                                    <p class="title">${ review.reTitle }</p><span class="write_date">${ review.reWritedate }</span>
	                                    <p class="contents">${ review.reContent }</p>
	                                </div>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <div class="page_wrap">
                        <ul class="page_list">
                            <li><a href="#" class="on">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
   		<!-- content end -->
   		<!-- footer -->
   		<%@ include file="../../common/footer.jsp" %>
   		<!-- footer end -->
   		<!-- pop-up -->
   		<%@ include file="../../common/popup.jsp" %>
   		<!-- pop-up end -->
	</div>
	<script src="../../js/jquery-3.5.1.min.js"></script>
	<script src="../../js/customer.js"></script>
   	<script src="../../js/main.js"></script>
</body>
</html>