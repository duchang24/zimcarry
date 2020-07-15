$(function(){
	if($("#h_idx").val() == "0"){
		
		$(".hIdxO").css("display", "none");
		$(".hIdxX").css("display", "block");
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

function find(start, recNum){
	let h_name = $("#find_hotel").val();
	
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?hName="+h_name+"&start="+start+"&recNum="+recNum, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			$(".hotelList1").css("display", "none");
			$(".hotelList2").children().remove();
			
			if(xhr.responseText.trim() == '[]'){
				alert("검색결과가 없습니다.");
				$("tr:last-child").after("<tr class='hotelList2'></tr>");
			}else{
				
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
					
					$("tr:last-child").after("<tr class='hotelList2'><td>"+(i+1)+"</td><td><a href='#' onclick='findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
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

function paging(page, list){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "./data/request_hotel.jsp?page="+page+"&list="+list, true);
	xhr.send();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			/*$(".hotelList1").css("display", "none");
			$(".hotelList2").children().remove();
			
			if(xhr.responseText.trim() == '[]'){
				alert("검색결과가 없습니다.");
				$("tr:last-child").after("<tr class='hotelList2'></tr>");
			}else{
				
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
					
					$("tr:last-child").after("<tr class='hotelList2'><td>"+(i+1)+"</td><td><a href='#' onclick='findHotel("+h_idx+")'>"+h_name+"</a></td><td>"+h_discount+"</td><td>"+h_partner+"</td></tr>");
				}
			}
			*/
		}
	}
}