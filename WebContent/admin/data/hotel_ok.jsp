<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="com.zimcarry.hotel.HotelDAO" id="hotelDAO"/>
<jsp:useBean class="com.zimcarry.hotel.HotelDTO" id="hotelDTO"/>
<%
	String uploadPath = request.getRealPath("uploadHotel");	// 이클립스에서 할때는 여기에 저장. 와르?로 만들었을 때는 상대경로로 만들어줘야함
	
	int size = 1024*1024*10;
				
	try{
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		hotelDTO.sethFile(multi.getFilesystemName("h_file"));
		hotelDTO.sethName(multi.getParameter("h_name"));
		hotelDTO.sethAddress(multi.getParameter("h_address"));
		hotelDTO.sethMap(multi.getParameter("h_map"));
		hotelDTO.sethDiscount(multi.getParameter("h_discount"));
		hotelDTO.sethPartner(multi.getParameter("h_partner"));
		
		if(hotelDAO.insertHotel(hotelDTO) == 0){
			out.println("<script>alert('추가가 실패하였습니다.');history.back();</scrip>");
		}else{
			out.println("<script>alert('추가되었습니다.');location.href='../hotel.jsp';</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
