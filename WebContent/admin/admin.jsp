<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = "admin";
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
	}
%>
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
            <a class="navbar-brand" href="javascript:;">관리자</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      <%
      	if (userid == null) {
      %>
      	<div class="login_wrap">
          <form method="post" action="login,jsp">
          	<p>Admin ID <input type="text" name="ad_adminid" id="ad_adminid"></p>
          	<p>Password <input type="password" name="ad_adminpw" id="ad_adminpw"></p>
          	<p><input type="submit" value="LOGIN"></p>
          </form>
      	</div>
      	<%
      	} else {
      	%>
      	<div class="logged_in_wrap">
      		<h3><%=userid%> 님 반갑습니다.</h3>
      		<div class="two_div_wrap">
	      		<div class="two ">
	      			관리자 리스트
	      		</div>
	      		<div class="two ">
	      			관리자 추가 수정 삭제
	      		</div>
      		</div>
      	</div>
      	<%
      	}
      	%>
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
  		$('.sidebar-wrapper ul.nav li:eq(0)').addClass("active");
  		$('#ad_adminid').focus();
  	})
  </script>
</body>

</html>