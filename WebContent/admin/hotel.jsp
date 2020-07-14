<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean class="com.zimcarry.hotel.HotelDTO" id="hotelDTO"/>
<jsp:useBean class="com.zimcarry.hotel.HotelDAO" id="hotelDAO"/>
<%
	int recNum = 12; // 페이지당 글 개수
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

<script src="./data/jquery-3.5.1.min.js"></script>

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
      			<p id="listBtn"><button onclick="list()">전체 리스트</button> <input type="hidden" name="findName" id="findName"></p>
      			
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
      			
				<tr class="hotelList1">
					<td>${status.count}</td>
					<td><a href="#" onclick="findHotel(${item.hIdx})">${item.hName}</a></td>
					
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
      		<form method="post" action="./data/hotel_ok.jsp" enctype="multipart/form-data" onsubmit="return checkform()">
      			<input type="hidden" name="h_idx" id="h_idx" value="0">
      			<div class="hIdxO">
      				<p>호텔 사진 <span id="fileoriginname"></span><input type="hidden" name="h_fileoriginname" id="h_fileoriginname"></p>
      				<p><input type="file" name="h_file2" id="h_file2"></p>
      			</div>
      			<div class="hIdxX">
      				<p>호텔 사진 <input type="file" name="h_file1" id="h_file1"></p>
      			</div>
      			<p>호텔 명 <input type="text" name="h_name" id="h_name"></p>
      			<p>호텔 주소 <input type="text" name="h_address" id="h_address"></p>
      			<p>호텔 지도 <input type="text" name="h_map" id="h_map"></p>
      			<p>호텔 할인 
      				<label id="label1_1">O</label><input type="radio" name="h_discount" value="O" id="radio1_1"> 
      				<label id="label1_2">X</label><input type="radio" name="h_discount" value="X" id="radio1_2">
      			</p>
      			<br>
      			<p>현재 제휴 상황 
      				<label id="label2_1">O</label><input type="radio" name="h_partner" value="O" id="radio2_1"> 
      				<label id="label2_2">X</label><input type="radio" name="h_partner" value="X" id="radio2_2">
      			</p>
      			<div class="hIdxO">
      				<p><input type="submit" value="수정"> <input type="button" value="비우기" onclick="resetInfor()"></p>
      			</div>
      			<div class="hIdxX">
      				<p><input type="submit" value="추가"></p>
      			</div>
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
  <script src="../assets/js/hotel.js"></script>
</body>

</html>

<script>
<<<<<<< HEAD
	$(function(){
		alert('1234');
		
		if($("#h_idx").val() == null || $("#h_idx").val() == ""){
			
			$(".hIdxO").css("display", "none");
			$(".hIdxX").css("display", "block");
		}
	});

	function findHotel(hIdx){
		$(".hIdxO").css("display", "block");
		$(".hIdxX").css("display", "none");
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "./data/request_hotel.jsp?hIdx="+hIdx, true);
		
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				let hotelInfor = new Array();
				hotelInfor = xhr.responseText.split("|");
				let h_idx = hotelInfor[0];
				let h_file = hotelInfor[1];
				let h_name = hotelInfor[2];
				let h_address = hotelInfor[3];
				let h_map = hotelInfor[4];
				let h_discount = hotelInfor[5];
				let h_partner = hotelInfor[6];
				
				$("#h_idx").val(hIdx);
				$("#h_discount").val(h_discount);
				$("#h_partner").val(h_partner);
				$("#h_name").val(h_name);
				$("#h_address").val(h_address);
				$("#h_map").val(h_map);
				document.getElementById("h_file").innerHTML = h_file;
			}
		}
		
	}
=======
>>>>>>> master
	
	function find(){
		let h_name = $("#find_hotel").val();
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "./data/request_hotel.jsp?hName="+h_name+"&start="+'${start}'+"&recNum="+'${recNum}', true);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){							
				let hotelList = xhr.responseText;
				hotelList = hotelList.replace('[','');
				hotelList = hotelList.replace(']','');
				
				let hotel = new Array();
				hotel = hotelList.split(", ");
				for(let i=0; i<hotel.length; i++){
					let hotelInfor = new Array();
					hotelInfor = hotel[i].split("|");
					let h_idx = hotelInfor[0];
					let h_name = hotelInfor[2];
					let h_discount = hotelInfor[5];
					let h_partner = hotelInfor[6];
					
					// table찾아서 tr 추가해주기
				}
				
				
				$(".hotelList1").css("display", "none");
			}
		}
		
	}
	
	function list(){
		$("#find_hotel").val("");
		$("#findName").val("");
	}
	
	
</script>
