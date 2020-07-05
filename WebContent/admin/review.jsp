<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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