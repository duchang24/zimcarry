<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>조회하기</title>
    <link href="../../css/common.css" rel="stylesheet">
	<link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald:400,500" rel="stylesheet">
    <link href="../../css/rs_Form.css" type="text/css" rel="stylesheet">
   <script>
	function popup() {
		var url = "js/Post.jsp";
		var name = "휴대폰 본인인증";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		return window.open(url, name, option);
	}
</script> 
</head>
<body>
    <%@ include file="../../common/header.jsp" %>

    <form method="post" action="3.jsp" onsubmit="return popup()">
        <h2>예약하기</h2>
		<p><label>이름 :<input type="text" name="p_name" value=" "></label></p>
        <p><label>휴대폰번호 :<input type="text" name="p_phone" value="ex)000-0000-0000"></label>
        <input type="button" id="btnphone" value="휴대폰인증" onclick="javascript:popup(this.form);"></p>
        <input type="hidden" name="ck_phone" value="no" id="isIdCheck">
        <p><input type="submit" value="다음으로">
        </p>
	</form>
    	<!-- footer -->
   		<%@ include file="../../common/footer.jsp" %>
   		<!-- footer end -->
   		<!-- pop-up -->
   		<%@ include file="../../common/popup.jsp" %>
   		<!-- pop-up end -->
</body>
</html>