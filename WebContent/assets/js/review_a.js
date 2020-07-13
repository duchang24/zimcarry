function review_d(reIdx, reBookidx) {
	var xhr = new XMLHttpRequest();
	
	var url = "review_ok.jsp?re_idx=" + reIdx + "&re_bookidx=" + reBookidx;
	xhr.open("GET", url, true);
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			
		}
	}
}