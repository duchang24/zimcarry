<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String admin_id = "";
	if(session.getAttribute("admin_id") != null){
		admin_id = (String)session.getAttribute("admin_id");
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
      	if (admin_id == null || admin_id.equals("")) {
      %>
      	<div class="login_wrap">
          <form method="post" action="admin_ok.jsp">
          	<p>Admin ID <input type="text" name="admin_id" id="admin_id"></p>
          	<p>Password <input type="password" name="admin_pw" id="admin_pw"></p>
          	<p><input type="submit" value="LOGIN"></p>
          	<p><input type="button" value="REGIST" onclick="location.href='admin_reg.jsp'"></p>
          </form>
      	</div>
      	<%
      	} else {
      	%>
      	<div class="logged_in_wrap">
      		<h3><%=admin_id%> 님 반갑습니다.</h3>
      		<div class="two_div_wrap">
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
  		
  		$('.sidebar-wrapper ul.nav li:eq(1)').addClass("off");
		$('.sidebar-wrapper ul.nav li:eq(2)').addClass("off");
		$('.sidebar-wrapper ul.nav li:eq(3)').addClass("off");
		$('.sidebar-wrapper ul.nav li:eq(4)').addClass("off");
		$('.sidebar-wrapper ul.nav li:eq(5)').addClass("off");
		<%
			if(session.getAttribute("admin_id") != null){
		%>
			$('.sidebar-wrapper ul.nav li:eq(1)').removeClass("off");
			$('.sidebar-wrapper ul.nav li:eq(2)').removeClass("off");
			$('.sidebar-wrapper ul.nav li:eq(3)').removeClass("off");
			$('.sidebar-wrapper ul.nav li:eq(4)').removeClass("off");
			$('.sidebar-wrapper ul.nav li:eq(5)').removeClass("off");
		<%
			}
		%>

  	});
  </script>
</body>

</html>