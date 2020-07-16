let currentpage = 1;
let recNum = 12;
let start = 0;
if(currentpage != null || currentpage != 1){
	start = (currentpage-1)*recNum;
}else{
	currentpage = 1;
	start = 0;
}
let firstpage = (((currentpage-1)/10)*10)+1;
let totCnt = $("#totCnt").val();
let pageCnt = (totCnt/recNum)+1;

$(function(){
	if($("#h_idx").val() == "0"){
		
		$(".hIdxO").css("display", "none");
		$(".hIdxX").css("display", "block");
	}
	
	
	
	currentpage = 1;	
	for(let i=firstpage; i<=pageCnt; i++){
		if(currentpage <= pageCnt){
			if(currentpage == pageCnt){
				$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
			}else if(currentpage != pageCnt){
				$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
			}
		}
	}
	
	$(".paging a:first-child").addClass('on');
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

function find(start1){
	let h_name = $("#find_hotel").val();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hName="+h_name+"&start="+start1+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("table tr:first-child").nextAll("tr").remove();
			
			if(xhr.responseText.trim() == '[]'){
				$("tr:last-child").after("<tr><td colspan='4'>검색 결과가 없습니다.</td></tr>");
			}else{
				
				let hotelList = xhr.responseText;
				
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
				
				pageCnt = (findCnt/recNum)+1;
				
				$("tr:last-child").after("<tr><td  colspan='4' id='page' class='paging'></td></tr>");
				
				currentpage = 1;
				for(let i=firstpage; i<=pageCnt; i++){
					if(currentpage <= pageCnt){
						if(currentpage == pageCnt){
							$(".paging").append("<a href='javascript:paging("+i+", "+findCnt+")'>"+i+"</a>");
						}else if(currentpage != pageCnt){
							$(".paging").append("<a href='javascript:paging("+i+", "+findCnt+")'>"+i+"</a>");
						}
					}
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

function paging(paging){	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?paging="+paging+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$("table tr:first-child").nextAll("tr").remove();
			
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
				
				$("tr:last-child").after("<tr><td>"+(i+1)+"</td><td><a href='javascript:findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
			}
			
			$("tr:last-child").after("<tr><td  colspan='4' id='page' class='paging'></td></tr>");
			
			if(firstpage > 10){
				$(".paging").append("<a href='#'>[이전]</a>");
			}
			
			for(let i=firstpage; i<=pageCnt; i++){
				if(paging <= pageCnt){
					if(paging == pageCnt){
						$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
					}else if(paging != pageCnt){
						$(".paging").append("<a href='javascript:paging("+i+")'>"+i+"</a>");
						currentpage = paging;
					}
				}
			}
			
			if(firstpage < pageCnt){
				$(".paging").append("<a href='#'>[다음]</a>");
			}
			
			$(".paging a:nth-child("+currentpage+")").addClass("on");
		}
	}
}