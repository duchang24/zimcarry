<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<jsp:useBean id="bookDTO" class="com.zimcarry.book.BookDTO" />

<c:set var="reviewList" value="${reviewDAO.selectReviewList()}" />

<!DOCTYPE html>
<html lang="ko">
<!-- head -->
<%@ include file="./head.jsp" %>

<body class="">
  <div class="wrapper ">
    <!-- side menu -->
    <%@ include file="./side_menu.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">이용후기 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      	<div class="review_table">
      		<table>
      			<thead>
      				<tr>
      					<th>번호</th>
      					<th>제목</th>
      					<th>작성자</th>
      					<th>만족도</th>
      					<th>이용날짜</th>
      					<th>숨김여부</th>
      				</tr>
      			</thead>
      			<tbody>
      				<c:forEach var="reviewItem" items='${ reviewList }' varStatus="status">
      				<c:set var="bookDTO" value="${bookDAO.selectBookWhereIdx(reviewItem.reBookidx)}" />
	      				<tr>
	      					<td>${ reviewItem.reIdx }</td>
	      					<td><a href='review.jsp=?re_idx=${reviewItem.reBookidx}'>${ reviewItem.reTitle }</a></td>
	      					<td>${ bookDTO.bName }</td>
	      					<td>${ reviewItem.reScore }</td>
	      					<td>${ bookDTO.bStartdate }</td>
	      					<td>${ bookDTO.bIsreview }</td>
	      				</tr>
      				</c:forEach>
      			</tbody>
      		</table>
      	</div>
        <!--  review_table end -->
        <!-- review detail -->
        <div class="review_detail">
        <c:set var="review_d" value="${ reviewDAO.selectReview(reviewDTO.reIdx) }" />
        <c:set var="bookDTO1" value="${bookDAO.selectBookWhereIdx(reviewItem.reBookidx)}" />
        	<p>
	        	<span class="left">글 번호 : ${ review_d.reIdx }</span> <span>작성일 : ${ review_d.reWritedate }</span> 
	        	<span>구간 : ${ bookDTO1.bStart } → ${ bookDTO1.bEnd }</span><br> 
	        	<span class="left">제목 : ${ review_d.reTitle }</span> <span>작성자 : ${ bookDTO1.bName }</span><br>
	        	<span>만족도 : ${ review_d.reScore }</span>
        	</p>
        	<p class="re_content">
        		${ review_d.reContent }
        	</p>
        	<p><label>숨김</label> <input type="radio" name="review" value="숨김"> 
        	<label>공개</label> <input type="radio" name="review" value="공개" checked="checked"></p>
        	<p><input type="button" value="수정"></p>
        </div>
      </div>
      <!-- footer -->
      <%@ include file="./footer.jsp" %>
    </div>
  </div>
  <!--   Core JS Files   -->
  <%@ include file="./core_js.jsp" %>
    <script>
  	$(function () {
  		$('.sidebar-wrapper ul.nav li').removeClass("active");
  		$('.sidebar-wrapper ul.nav li:eq(6)').addClass("active");
  	})
  </script>
</body>
</html>