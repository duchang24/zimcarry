<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<<<<<<< HEAD

<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />

<c:set var="reviewList" value="${reviewDAO.getReviewList()}" scope="page" />

=======
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />
<c:set var="reviewList" value="${reviewDAO.getreviewList()}" scope="page" />
>>>>>>> 707b2909e2bc45515aafb655849e1cc09a6a66d8
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
<<<<<<< HEAD
      		<table>
      			<thead>
      				<tr>
						<th>번호</th>
      					<td>제목</th>
      					<th>작성자</th>
      					<th>만족도</th>
      					<th>이용날짜</th>
      					<th>숨김여부</th>
=======
      	<div class="review_list">
      		<table>
      			<thead>
      				<tr>
      					<td>번호</td>
      					<td>제목</td>
      					<td>작성자</td>
      					<td>만족도</td>
      					<td>이용날짜</td>
      					<td>숨김여부</td>
>>>>>>> 707b2909e2bc45515aafb655849e1cc09a6a66d8
      				</tr>
      			</thead>
      			<tbody>
      				<c:forEach var="reviewItem" items='${ reviewList }' varStatus="status">
	      				<tr>
<<<<<<< HEAD
	      					<td>${ reviewItem.reIdx }</td>
	      					<td><a href="review_viewpage.jsp">${ reviewItem.reTitle }</a></td>
	      					<td>${ reviewItem.reScore }</td>
	      					<td>${ reviewItem.reScore }</td>
	      					<td>${ reviewItem.reScore }</td>
	      					<td>${ reviewItem.reScore }</td>
=======
	      					<td></td>
	      					<td></td>
	      					<td></td>
	      					<td></td>
	      					<td></td>
>>>>>>> 707b2909e2bc45515aafb655849e1cc09a6a66d8
	      				</tr>
      				</c:forEach>
      			</tbody>
      		</table>
      	</div>
        <!--  review_table end -->
<<<<<<< HEAD
=======
      	</div>
>>>>>>> 707b2909e2bc45515aafb655849e1cc09a6a66d8
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