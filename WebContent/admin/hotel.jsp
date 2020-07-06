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
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		
		if(conn != null){
			//sql = "SELECT count(b_idx) as cnt FROM tb_board";
			// 필드 이름으로 가져올 수 있으나 좋은 방법이 아님. 필드명으로 불러오는게 좋음. 그래서 필드명을 만들어줌
			//pstmt = conn.prepareStatement(sql);
		//	rs = pstmt.executeQuery();
		//	if(rs.next()){
		//		totCnt = rs.getInt("cnt");
		//	}
			
			sql = "SELECT h_idx, h_file, h_name, h_address, h_map, h_discount, h_partner FROM tb_hotel order by h_idx asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html lang="ko">
<!-- head -->
<%@ include file="./head.jsp" %>

<style>
	h3 { margin-bottom: 20px; }
	.hotel_content { width: 90%; margin: 70px auto 60px; }
	
	.hotel_content #find_hotel { position: relative; }
	.hotel_content #find_hotel input { width: 88%; height: 50px; padding: 10px; }
	.hotel_content #find_hotel button { width: 10%; height: 50px; position: absolute; bottom: 0; right: 0; }
	
	.hotel_content #hotel_table table { border: 3px solid gray; width: 100%; border-collapse: collapse; }
	.hotel_content #hotel_table table th { border: 1px solid #ddd; height: 50px; text-align: center; font-size: 18px; }
	.hotel_content #hotel_table table td { border: 1px solid #ddd; height: 35px; font-size: 16px; }
	.hotel_content #hotel_table table tr:first-child th:nth-child(1) { width: 10%; }
	.hotel_content #hotel_table table tr:first-child th:nth-child(2) { width: 20%; }
	.hotel_content #hotel_table table tr:first-child th:nth-child(3) { width: 50%; }
	.hotel_content #hotel_table table tr:first-child th:nth-child(4) { width: 20%; }
	.hotel_content #hotel_table table td:first-child, .hotel_content #hotel_table table td:nth-child(2), .hotel_content #hotel_table table td:last-child { text-align: center; }
	.hotel_content #hotel_table #page { width: 100%; margin-top: 20px; text-align: center; font-size: 20px; line-height: 40px; }
	.hotel_content #hotel_table button { float: right; width: 100px; height: 40px; line-height: 0; }
	
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
      	<div id="find_hotel">
      		<h3>제휴 호텔 검색</h3>
      		<input type="text" name="find_hotel" id="find_hotel" placeholder="검색할 호텔을 입력하세요."> <button onclick="input()">검색</button>
      	</div>
      	<hr>
      	<div id="hotel_table">
      		<h3>현재 제휴 호텔</h3>
      		<table>
      			<tr>
      				<th>번호</th>
      				<th>현재 제휴</th>
      				<th>이름</th>
      				<th>할인</th>      				
      			</tr>
<%
			while(rs.next()){
				int h_idx = rs.getInt("h_idx");
				String h_file = rs.getString("h_file");
				String h_name = rs.getString("h_name");
				String h_address = rs.getString("h_address");
				String h_map = rs.getString("h_map");
				String h_discount = rs.getString("h_discount");
				String h_partner = rs.getString("h_partner");
%>
				<tr>
					<td><%=h_idx%></td>
					<td><%=h_partner%></td>
					<td><%=h_name%></td>
					<td><%=h_discount%></td>
				</tr>
<%
	}
%>
      		</table>
      		<p id="page">1 2 3 4 5 6 7 8 9 10</p>
      	</div>
      	<div id="add_hotel">
      		<h3>제휴 호텔 추가</h3>
      		<hr>
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