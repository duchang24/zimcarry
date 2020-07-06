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

<style>
	@import url("../assets/css/Z_style.css");
	/* hotel */
	/* .hotel_content { margin-top: 70px; } */
	
	.hotel_content .hotel { width: 90%; min-height: 200px; margin: 0 auto 30px;	padding: 30px; border: 1px solid #cdcdcd; border-radius: 10px; background-color: #f6f6f6; box-shadow: 8px 8px 20px #ccc; }
	.hotel_content .hotel_find div { position: relative; }
	.hotel_content .hotel_find div input { width: 80%; height: 50px; padding: 10px; }
	.hotel_content .hotel_find div button { width: 15%; height: 50px; position: absolute; bottom: 0; right: 0; }
	
	.hotel_content .hotel_list table { width: 100%; text-align: center; }
	.hotel_content .hotel_list table th { height: 50px; background-color: #ecf0f1; border-bottom: 2px solid #34495e; }
	.hotel_content .hotel_list table td { height: 50px; border-bottom: 1px solid #bdc3c7; }
	.hotel_content .hotel_list table tr:first-child th:nth-child(1) { width: 15%; }
	.hotel_content .hotel_list table tr:first-child th:nth-child(2) { width: 45%; }
	.hotel_content .hotel_list table tr:first-child th:nth-child(3) { width: 20%; }
	.hotel_content .hotel_list table tr:first-child th:nth-child(4) { width: 20%; }
	.hotel_content .hotel_list table td:nth-child(2) { text-align: left; }
	.hotel_content .hotel_list #page { width: 100%; margin-top: 20px; text-align: center; font-size: 20px; line-height: 40px; }

	.hotel_content .hotel_view
	
	
	.hotel_content #add_hotel form p { font-size: 20px; position: relative; margin: 16px 0; line-height: 50px; }
	.hotel_content #add_hotel form input { width: 70%; height: 50px; padding: 10px; position: absolute; right: 0; font-size: 16px; }
	.hotel_content #add_hotel form input[type="file"] { line-height: 45px; padding: 0; }
	.hotel_content #add_hotel form label { position: absolute; }
	.hotel_content #add_hotel form label#label1_1, .hotel_content #add_hotel form label#label2_1 { top: 10px; right: 68%; font-size: 20px; }
	.hotel_content #add_hotel form label#label1_2, .hotel_content #add_hotel form label#label2_2 { top: 10px; right: 58%; font-size: 20px; }
	.hotel_content #add_hotel form input#radio1_1, .hotel_content #add_hotel form input#radio2_1 { width: 30px; height: 30px; top: 10px; right: 63%; }
	.hotel_content #add_hotel form input#radio1_2, .hotel_content #add_hotel form input#radio2_2 { width: 30px; height: 30px; top: 10px; right: 53%; }
	.hotel_content #add_hotel form input[type="submit"] { width: 40%; position: relative; margin: 20px 4.8%; font-size: 20px; line-height: 30px; }
	.hotel_content #add_hotel form input[type="button"] { width: 40%; position: relative; margin: 20px 4.8%; font-size: 20px; line-height: 30px; }
</style>

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
      		<h3>현재 제휴 호텔</h3>
      		<table>
      			<tr>
      				<th>번호</th>
      				<th>이름</th>
      				<th>할인</th>
      				<th>현재 제휴</th>      				
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
      		<h3>제휴 호텔 추가</h3>
      		<form method="post" action="./data/hotel_ok.jsp" enctype="multipart/form-data">
      			<p>호텔 사진 <input type="file" name="h_file"></p>
      			<p>호텔 명 <input type="text" name="h_name"></p>
      			<p>호텔 주소 <input type="text" name="h_address"></p>
      			<p>호텔 지도 <input type="text" name="h_map" id="h_map"></p>
      			<p>호텔 할인 <label id="label1_1">O</label><input type="radio" name="h_discount" value="O" id="radio1_1" checked> <label id="label1_2">X</label><input type="radio" name="h_discount" value="X" id="radio1_2"></p>
      			<br>
      			<p>현재 제휴 상황 <label id="label2_1">O</label><input type="radio" name="h_partner" value="O" id="radio2_1" checked> <label id="label2_2">X</label><input type="radio" name="h_partner" value="X" id="radio2_2"></p>
      			<p><input type="submit" value="추가"> <input type="button" value="업데이트" onclick="location.href='./data/hotel_edit.jsp'"></p>
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