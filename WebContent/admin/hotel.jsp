<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mariadb://localhost:3306/zimcarry";
	String uid = "root";
	String upw = "1234";
	
	
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
            <a class="navbar-brand" href="javascript:;">제휴 호텔 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="hotel_content">
      	<div class="hotel_find hotel">
      		<h3>제휴 호텔 검색</h3>
      		<div>
      			<input type="text" name="find_hotel" id="find_hotel" placeholder="검색할 호텔을 입력하세요.">
      			<button onclick="input()">검색</button>
      		</div>
      	</div>
      	<div class="hotel_list hotel">
      		<table>
      			<tr>
      				<th>번호</th>
      				<th>이름</th>
      				<th>할인</th>
      				<th>현재 제휴</th>      				
      			</tr>
				<tr>
					<td>01</td>
					<td><a href="">00호텔</a></td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
				<tr>
					<td>01</td>
					<td>00호텔</td>
					<td>O</td>
					<td>O</td>
				</tr>
      		</table>
      		<p id="page">1 2 3 4 5 6 7 8 9 10</p>
      	</div>
      	<div class="hotel_view hotel">
      		<h3>제휴 호텔</h3>
      		<form method="post" action="./data/hotel_ok.jsp" enctype="multipart/form-data">
      			<p>호텔 사진 <input type="file" name="h_file"></p>
      			<p>호텔 명 <input type="text" name="h_name"></p>
      			<p>호텔 주소 <input type="text" name="h_address"></p>
      			<p>호텔 지도 <input type="text" name="h_map" id="h_map"></p>
      			<p>호텔 할인 <label id="label1_1">O</label><input type="radio" name="h_discount" value="O" id="radio1_1" checked> <label id="label1_2">X</label><input type="radio" name="h_discount" value="X" id="radio1_2"></p>
      			<br>
      			<p>현재 제휴 상황 <label id="label2_1">O</label><input type="radio" name="h_partner" value="O" id="radio2_1" checked> <label id="label2_2">X</label><input type="radio" name="h_partner" value="X" id="radio2_2"></p>
      			<p><input type="submit" value="추가"></p>
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
  		$('.sidebar-wrapper ul.nav li:eq(2)').addClass("active");
  	})
  </script>
</body>

</html>