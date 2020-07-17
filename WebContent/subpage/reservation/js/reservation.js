$(function() {
    $( "#Datepickerstart" ).datepicker({
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        minDate: 0
   });
   $( "#Datepickerend" ).datepicker({
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        minDate: 0,
		maxDate: 2
   });
   var bOver26 = 0;
   var bUnder26 = 0;
   var sum = 0;
   var sum1 = 0;
   var sum2 = 0
   $("#bOver26").on('keyup',function(){
	sum1 = 0;
	sum = 0;
	bOver26 = (15000*$('#bOver26').val());
	sum1 += bOver26;
	sum = sum1+sum2;
	$("#bPrice").val(sum);
   });
   $("#bUnder26").on('keyup',function(){
	sum2 = 0;
	sum =0;
	bUnder26 = (10000*$('#bUnder26').val());
	sum2 += bUnder26;
	sum = sum1+sum2;
	$("#bPrice").val(sum);
   });
}); 

	function popup() {
           var name = "휴대폰 본인인증";
           var option = "width = 500, height = 500, top = 100, left = 200, location = no";
           var phone = document.getElementById("phone2").value;
           var url = "js/Post.jsp?phone=";
           url = url+phone;
           var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
           if(!(regExp.test(phone)))
           {
               alert("전화번호를 바르게 입력하세요");
           }else{
           
               window.open(url, name, option);
           }
       }

	function isEmpty(obj, msg){
		if(typeof obj == "string"){
			obj = document.querySelector("#" + obj);			
		}
		if(obj.value ==""){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}
	
	function chkform(){
		var form = document.my_form;
		
		if(isEmpty(form.name2,"이름을 입력하세요")) return flase;
		
		if(isEmpty(form.phone2,"전화번호을 입력하세요")) return flase;
		
		if(isEmpty(form.b_start,"구간을 입력하세요")) return flase;
		
		if(isEmpty(form.b_end,"구간을 입력하세요")) return flase;
		
		if(isEmpty(form.bBookingdate,"예약날짜을 입력하세요")) return flase;
		
		if(isEmpty(form.bBookingtime1,"예약 시간을 입력하세요")) return flase;
		
		if(isEmpty(form.bBookingtime2,"예약 시간을 입력하세요")) return flase;
		
		if(isEmpty(form.bBookingtime1,"예약 시간을 입력하세요")) return flase;
		
		if(isEmpty(form.bBookingdateend,"찾는 날짜을 입력하세요")) return flase;
		
		if(isEmpty(form.bOver26,"물건 수량을 입력하세요")) return flase;
		
		if(isEmpty(form.bUnder26,"물건 수량을 입력하세요")) return flase;
		
		
		
	}
