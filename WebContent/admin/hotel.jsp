<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean class="com.zimcarry.hotel.HotelDTO" id="hotelDTO"/>
<jsp:useBean class="com.zimcarry.hotel.HotelDAO" id="hotelDAO"/>
<%
	int recNum = 10; // 페이지당 글 개수
	int start = 0;	// 시작글 번호
	int totCnt = hotelDAO.totCnt();
	
	String pagenum = request.getParameter("pagenum");
	if(pagenum != null && !pagenum.equals("")){
		start = (Integer.parseInt(pagenum)-1) * recNum;
	}else{
		pagenum = "1";
		start = 0;
	}
	
	int pageCnt = (totCnt / recNum) + 1;
	
	String nowpage = request.getParameter("pagenum");
%>
<c:set var="nowpage" value="<%=nowpage%>"/>
<c:set var="start" value="<%=start%>"/>
<c:set var="recNum" value="<%=recNum%>"/>

<c:set var="hotelList" value="${hotelDAO.selectHotel(start, recNum)}"/>

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
      			<p id="findArea"><input type="search" name="find_hotel" id="find_hotel" placeholder="검색할 호텔을 입력하세요."> <button onclick="find()">검색</button></p>
      			<p id="listBtn"><button onclick="list()">전체 리스트</button></p>
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
      			<c:forEach var="item" items="${hotelList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><a href="hotel.jsp?pagenum=${nowpage}&hIdx=${item.hIdx}">${item.hName}</a></td>
					<td>${item.hDiscount}</td>
					<td>${item.hPartner}</td>
				</tr>
				</c:forEach>
      		</table>
      		<p id="page" class="paging">
			<%
				for(int i=1; i<=pageCnt; i++){
					out.print("<a href='hotel.jsp?pagenum="+i+"'>" + i + "</a>" + " ");	
				}
			%>
			</p>
      	</div>
      	<div class="hotel_view hotel">
      		<h3>제휴 호텔</h3>
      		<input type="hidden" name="h_idx" value="0">
   		<%
      		String h_idx = request.getParameter("hIdx");
      		if(h_idx != null && !h_idx.equals("")){
      	%>
      		<c:set var="h_idx" value="<%=h_idx%>"/>
      		<c:set var="viewHotel" value="${hotelDAO.viewHotel(h_idx)}"/>
      		<form method="post" action="./data/hotel_ok.jsp" enctype="multipart/form-data">
      			<p>호텔 사진 <span>${viewHotel.hFile}</span></p>
      			<p><input type="file" name="h_file"></p>
      			<p>호텔 명 <input type="text" name="h_name" value="${viewHotel.hName}"></p>
      			<p>호텔 주소 <input type="text" name="h_address" value="${viewHotel.hAddress}"></p>
      			<p>호텔 지도 <input type="text" name="h_map" id="h_map" value="${viewHotel.hMap}"></p>
      			<p>호텔 할인 <label id="label1_1">O</label><input type="radio" name="h_discount" value="O" id="radio1_1" 
      			<c:if test="${viewHotel.hDiscount == 'O'}">
					checked
				</c:if>
      			> <label id="label1_2">X</label><input type="radio" name="h_discount" value="X" id="radio1_2"
      			<c:if test="${viewHotel.hDiscount == 'X'}">
					checked
				</c:if>
      			></p>
      			<br>
      			<p>현재 제휴 상황 <label id="label2_1">O</label><input type="radio" name="h_partner" value="O" id="radio2_1"
      			<c:if test="${viewHotel.hPartner == 'O'}">
					checked
				</c:if>
      			> <label id="label2_2">X</label><input type="radio" name="h_partner" value="X" id="radio2_2"
      			<c:if test="${viewHotel.hPartner == 'X'}">
					checked
				</c:if>
      			></p>
      			<p><input type="submit" value="수정"> <input type="button" value="비우기" onclick="location.href='hotel.jsp?pagenum=${nowpage}'"></p>
      		</form>
      	<%
      		}else{
      	%>
      		<form method="post" action="./data/hotel_ok.jsp" enctype="multipart/form-data" onsubmit="return checkform()">
      			<p>호텔 사진 <input type="file" name="h_file" id="h_file"></p>
      			<p>호텔 명 <input type="text" name="h_name" id="h_name"></p>
      			<p>호텔 주소 <input type="text" name="h_address" id="h_address"></p>
      			<p>호텔 지도 <input type="text" name="h_map" id="h_map" id="h_map"></p>
      			<p>호텔 할인 <label id="label1_1">O</label><input type="radio" name="h_discount" value="O" id="radio1_1" checked> <label id="label1_2">X</label><input type="radio" name="h_discount" value="X" id="radio1_2"></p>
      			<br>
      			<p>현재 제휴 상황 <label id="label2_1">O</label><input type="radio" name="h_partner" value="O" id="radio2_1" checked> <label id="label2_2">X</label><input type="radio" name="h_partner" value="X" id="radio2_2"></p>
      			<p><input type="submit" value="추가"></p>
      		</form>
      		
      		<script>
				function checkform(){
										
					if($("#h_file").val() == ""){
						alert("파일을 선택해주세요.");
						return false;
					}
					
					if($("#h_name").val() == ""){
						alert("이름을 입력해주세요.");
						$("#h_name").focus();
						return false;
					}
					
					if($("#h_address").val() == ""){
						alert("주소를 입력해주세요.");
						$("#h_address").focus();
						return false;
					}
					
					if($("#h_map").val() == ""){
						alert("지도를 입력해주세요.");
						$("#h_map").focus();
						return false;
					}
					
					return true;
				}
				
				function find(){
					let h_name = $("#find_hotel").val();
					alert(h_name);
				}
				
				function list(){
					$("#find_hotel").val("");
				}
			</script>

      	<%
      		}
   		%>
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
