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
          <form method="post" action="./data/admin_ok.jsp">
          	<p>Admin ID <input type="text" name="admin_id" id="admin_id"></p>
          	<p>Password <input type="password" name="admin_pw" id="admin_pw"></p>
          	<p class="login_btn"><input type="submit" value="LOGIN" id="login_btn"></p>
          	<p class="login_btn"><input type="button" value="REGIST" onclick="location.href='admin_reg.jsp'"></p>
          </form>
      	</div>
      	<%
      	} else {
      	%>
      	<div class="logged_in_wrap">
      		<p id="admin_ok"><img src="../assets/img/ico_logo_title.png" alt="짐캐리 로고" /><%=admin_id%> 님 반갑습니다.</p>
      		<p id="admin_logout"><input type="button" value="로그아웃" name="logout_btn" onclick="location.href='admin_logout.jsp'" /></p>
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
  		$('#admin_id').focus();
  		for(let i = 1; i <= 5; i++) {
  			$('.sidebar-wrapper ul.nav li:eq(' + i + ')').addClass("off");
  		}
		<%
			if(session.getAttribute("admin_id") != null){
		%>
				for(let i = 1; i <= 5; i++) {
		  			$('.sidebar-wrapper ul.nav li:eq(' + i + ')').removeClass("off");
		  		}
		<%
			}
		%>
		$('#login_btn').on("click", function() {
  			if($('#admin_id').val() == "" || $('#admin_pw').val() == "") {
  				alert("아이디와 비밀번호를 모두 입력하세요.");
  				return false;
  			}
  		});
  	});
  </script>
</body>

</html>