<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<!-- head -->
<%@ include file="./head.jsp" %>

<body>
	<div class="wrapper">
		<!-- side menu -->
		<%@ include file="./side_menu.jsp" %>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:;">예약 관리</a>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<h1>예약 관리</h1>
				
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
  		$('.sidebar-wrapper ul.nav li:eq(1)').addClass("active");
  	})
  </script>
</body>

</html>