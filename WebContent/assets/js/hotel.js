let totCnt = $("#totCnt").val();	// 전체 게시물 수
let recNum = 12;	// 한 페이지당 보여줄 개수
let totPage = totCnt / recNum;	// 총 페이지 수
totPage = Math.floor(totPage);
if(totCnt % recNum > 0){
	totPage++;
}
let currentPage = 1;	// 현재 페이지
if(totPage < currentPage){
	currentPage = totPage;
}
let start = ((currentPage-1) / 5) * 5 + 1;	// 시작 페이지 번호
let end = start + 5 -1;
if(end > totPage){
	end = totPage;
}

$(function(){
	if($("#h_idx").val() == "0"){
		
		$(".hIdxO").css("display", "none");
		$(".hIdxX").css("display", "block");
	}
	
	if(currentPage > 1){
		$(".paging").prepend("<a id='prev' href='javascript:paging("+(currentPage-1)+", "+totCnt+")'>&lt;</a></div>");
	}
	
	for(let i=start; i<=end; i++){
		if(i == currentPage){
			$(".paging").append("<a href='javascript:paging("+i+", "+totCnt+")'>"+i+"</a>");
			$(".paging a").addClass("on");
		}else{
			$(".paging").append("<a href='javascript:paging("+i+", "+totCnt+")'>"+i+"</a>");
		}
		
	}
	
	if(currentPage < totPage){
		$(".paging").append("<a id='next' href='javascript:paging("+(currentPage+1)+", "+totCnt+")'>&gt;</a>");
	}
	
	if(currentPage == totPage){
		$(".paging #next").remove();
	}
	
});

function checkform(){
	if($("#h_file1").val() == ""){
		if($("#h_fileoriginname").val() == ""){
			alert("파일을 선택해주세요.");
			return false;
		}
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

function findHotel(hIdx){
	$(".paging a.on").removeClass('on');
	
	$(".hIdxO").css("display", "block");
	$(".hIdxX").css("display", "none");
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hIdx="+hIdx, true);
	
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			let hotelInfor = new Array();
			hotelInfor = xhr.responseText.trim().split("|");
			let h_idx = hotelInfor[0];
			let h_file = hotelInfor[1];
			let h_name = hotelInfor[2];
			let h_address = hotelInfor[3];
			let h_map = hotelInfor[4];
			let h_discount = hotelInfor[5];
			let h_partner = hotelInfor[6];
			
			$("#h_idx").val(hIdx);
			$("#h_name").val(h_name);
			$("#h_address").val(h_address);
			$("#h_map").val(h_map);
			$("#h_fileoriginname").val(h_file);
			document.getElementById("fileoriginname").innerHTML = h_file;
			
			if(h_discount.trim() == 'O'){
				$("input:radio[name='h_discount']:radio[value='O']").prop('checked', true);
			}else if(h_discount.trim() == 'X'){
				$("input:radio[name='h_discount']:radio[value='X']").prop('checked', true);
			}
			if(h_partner.trim() == 'O'){
				$("input:radio[name='h_partner']:radio[value='O']").prop('checked', true);
			}else if(h_partner.trim() == 'X'){
				$("input:radio[name='h_partner']:radio[value='X']").prop('checked', true);
			}
		}
	}
}

function resetInfor(){
	$("#h_idx").val("0");
	$("#h_name").val("");
	$("#h_address").val("");
	$("#h_map").val("");
	$("#h_fileoriginname").val("");
	document.getElementById("fileoriginname").innerHTML = "";
	
	$(".hIdxO").css("display", "none");
	$(".hIdxX").css("display", "block");
}

function find(){
	$(".paging a.on").removeClass('on');
	
	let h_name = $("#find_hotel").val();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hName="+h_name+"&start="+start+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("table tr:first-child").nextAll("tr").remove();
			
			if(xhr.responseText.trim() == '[]'){
				$("tr:last-child").after("<tr><td colspan='4'>검색 결과가 없습니다.</td></tr>");
			}else{
				
				let hotelList = xhr.responseText.trim();
				
				hotelList = hotelList.replace('[','');
				hotelList = hotelList.replace(']','');
				
				let hotel = new Array();
				hotel = hotelList.split(", ");
				let findCnt = 0;
				for(let i=0; i<hotel.length; i++){
					let hotelInfor = new Array();
					hotelInfor = hotel[i].split("|");
					let h_idx = hotelInfor[0];
					let h_name = hotelInfor[2];
					let h_discount = hotelInfor[5];
					let h_partner = hotelInfor[6];
					
					$("tr:last-child").after("<tr><td>"+(i+1)+"</td><td><a href='javascript:findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
					
					findCnt++;
				}
				
				totCnt = findCnt;
				totPage = totCnt / recNum;	// 총 페이지 수
				totPage = Math.floor(totPage);
				if(totCnt % recNum > 0){
					totPage++;
				}
				currentPage = 1;	// 현재 페이지
				if(totPage < currentPage){
					currentPage = totPage;
				}
				start = ((currentPage-1) / 5) * 5 + 1;	// 시작 페이지 번호
				end = start + 5 -1;
				if(end > totPage){
					end = totPage;
				}
				
				if(currentPage > 1){
					$(".paging").prepend("<a id='prev' href='javascript:paging("+(currentPage-1)+", "+totCnt+")'>&lt;</a></div>");
				}
				
				for(let i=start; i<=end; i++){
					if(i == currentPage){
						$(".paging").append("<a href='javascript:paging("+i+", "+totCnt+")'>"+i+"</a>");
						$(".paging a").addClass("on");
					}else{
						$(".paging").append("<a href='javascript:paging("+i+", "+totCnt+")'>"+i+"</a>");
					}
					
				}
				
				if(currentPage < totPage){
					$(".paging").append("<a id='next' href='javascript:paging("+(currentPage+1)+", "+totCnt+")'>&gt;</a>");
				}
				
				if(currentPage == totPage){
					$(".paging #next").remove();
				}
			}
			
		}
	}
}
	
function list(){
	if($("#find_hotel").val() == null || $("#find_hotel").val() == ""){
		
	}else{
		location.reload();
	}
}

function paging(paging, totalCnt){	
	$(".paging a.on").removeClass('on');
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?paging="+paging+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("table tr:first-child").nextAll("tr").remove();
			
			let hotelList = xhr.responseText.trim();
				
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
				
				$("tr:last-child").after("<tr><td>"+(i+1)+"</td><td><a href='javascript:findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
			}
			
			$("tr:last-child").after("<tr><td  colspan='4' id='page' class='paging'></td></tr>");
			
			totCnt = totalCnt
			totPage = totCnt / recNum;
			totPage = Math.floor(totPage);
			if(totCnt % recNum > 0){
				totPage++;
			}
			currentPage = paging;
			if(totPage < currentPage){
				currentPage = totPage;
			}
			start = ((currentPage-1) / 5) * 5 + 1;	// 시작 페이지 번호
			end = start + 5 -1;
			if(end > totPage){
				end = totPage;
			}
			
			if(currentPage > 1){
				$(".paging").prepend("<a id='prev' href='javascript:paging("+(currentPage-1)+", "+totCnt+")'>&lt;</a></div>");
			}
			
			for(let i=start; i<=end; i++){
				if(i == currentPage){
					$(".paging").append("<a href='javascript:paging("+i+", "+totCnt+")'>"+i+"</a>");
					$(".paging a").addClass("on");
				}else{
					$(".paging").append("<a href='javascript:paging("+i+", "+totCnt+")'>"+i+"</a>");
				}
				
			}
			
			if(currentPage < totPage){
				$(".paging").append("<a id='next' href='javascript:paging("+(currentPage+1)+", "+totCnt+")'>&gt;</a>");
			}
			
			if(currentPage == totPage){
					$(".paging #next").remove();
				}
		}
	}
}