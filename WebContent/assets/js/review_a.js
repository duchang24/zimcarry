function review_d(reIdx, reBookidx) {
	xhr = new XMLHttpRequest();
	
	var url = "review_ok.jsp?re_idx=" + reIdx + "&re_bookidx=" + reBookidx;
	xhr.open("GET", url, true);
	
}