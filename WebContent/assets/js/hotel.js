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