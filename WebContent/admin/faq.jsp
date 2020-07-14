<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%  request.setCharacterEncoding("utf-8"); %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="faqDTO" class="com.zimcarry.faq.FaqDTO" />
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO" />
<jsp:useBean id="util" class="com.zimcarry.util.Util" />
<c:set var="pageNum" value="1" />
<c:set var="limit" value=", 8" />
<c:if test="${pageNum ne null}" >
	<c:set var="pageNum" value="${param.pageNum}" />
	<c:if test="${param.pageNum eq null}">
		<c:set var="pageNum" value="1" />
	</c:if>
	<c:choose>
		<c:when test="${pageNum eq 1 || pageNum eq null}">
			<c:set var="limit" value="0, 8" />
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${pageNum * 8 - 8}" />
			<c:set var="limit" value="${start}${limit}" />
		</c:otherwise>
	</c:choose>
</c:if>
<c:set var="noticeList" value="${noticeDAO.getNoticeList('y', limit)}" scope="page" />
<c:set var="page" value="${util.paging(noticeDAO.noticeListSize(), 8)}" />
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
            <a class="navbar-brand" href="javascript:;">공지사항 게시글 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      	<div class="list_up notice">
      		<dl>
      			<dt>
      				<p>작성일 : 2020-07-05 // 숨김 여부 : n</p>
      				<p>질문 : 예약을 취소 / 환불 받고 싶어요.</p>
      			</dt>
      			<dd>
      				<div>
						<p>짐캐리의 예약 취소/환불은 아래와 같이 이루어집니다.</p>
						<p>1. 홈페이지 예약: 서비스 이용 전날 21시 전까지 예약을 취소한 경우, 결제 금액의 90%를 환불받으실 수 있습니다. 서비스 이용 전날 21시 이후에는 취소는 가능하지만 환불은 불가합니다.</p>
						<p>2. 짐캐리 매장 현장접수: 영수증을 지참하신 경우 취소/환불이 가능합니다. 단, 고객님의 수화물 운송이 시작되면 취소/환불이 불가합니다.</p>
      				</div>
      			</dd>
      		</dl>
      	</div>
      	<div class="list_down notice">
      		<form method="post" action="./data/faq_ok.jsp" onsubmit="return checkForm()">
      			<p>질문</p>
      			<p><textarea name="fQuestion" id="fQuestion" placeholder="질문을 작성하세요"></textarea></p>
      			<p>답변</p>
      			<p><textarea name="fAnswer" id="fAnswer" placeholder="답변을 작성하세요"></textarea></p>
      			<p>게시글을 감추시겠습니까? <label for="fHiddenyse">예 </label><input type="radio" name="fHidden" id="no_hiddenyse" value="y"> <label for="fHiddenno">아니요 </label><input type="radio" name="fHidden" id="fHiddenno" value="n"></p>
      			<input type="hidden" name="noIdx" id="noIdx">
      			<p id="btn_wrap">
      				<input type="submit" value="작성" id="btn_write" name="btn_write">
      			</p>
      		</form>
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
  		$('.sidebar-wrapper ul.nav li:eq(5)').addClass("active");
  	});
  </script>
  <script src="../assets/js/faq.js"></script>
</body>

</html>