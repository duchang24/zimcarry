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
	String uploadPath = request.getRealPath("uploadHotel");
	
	int size = 1024*1024*10;
	
	try{
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		
		if(multi.getParameter("h_idx").equals("0")){	// h_idx가 0일 때 (호텔 추가)			
			hotelDTO.sethFile(multi.getFilesystemName("h_file1"));
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
		}else{	// h_idx가 0이외의 숫자일 때 (호텔 수정)
			String h_idx = multi.getParameter("h_idx");
			int hIdx = Integer.parseInt(h_idx);
			
			try{
				if(!multi.getFilesystemName("h_file2").equals("") || !multi.getFilesystemName("h_file2").equals(null)){	// 파일 수정할 때
					hotelDTO.sethIdx(hIdx);
					hotelDTO.sethFile(multi.getFilesystemName("h_file2"));
					hotelDTO.sethName(multi.getParameter("h_name"));
					hotelDTO.sethAddress(multi.getParameter("h_address"));
					hotelDTO.sethMap(multi.getParameter("h_map"));
					hotelDTO.sethDiscount(multi.getParameter("h_discount"));
					hotelDTO.sethPartner(multi.getParameter("h_partner"));
					
					if(hotelDAO.updateHotel(hotelDTO) == 0){
						out.println("<script>alert('수정이 실패하였습니다.');history.back();</scrip>");
					}else{
						out.println("<script>alert('수정되었습니다.');location.href='../hotel.jsp';</script>");
					}
				}
			}catch(NullPointerException ne){	// 파일 수정 안할 때
				hotelDTO.sethIdx(hIdx);
				hotelDTO.sethFile(multi.getParameter("h_fileoriginname"));
				hotelDTO.sethName(multi.getParameter("h_name"));
				hotelDTO.sethAddress(multi.getParameter("h_address"));
				hotelDTO.sethMap(multi.getParameter("h_map"));
				hotelDTO.sethDiscount(multi.getParameter("h_discount"));
				hotelDTO.sethPartner(multi.getParameter("h_partner"));
				
				if(hotelDAO.updateHotel(hotelDTO) == 0){
				out.println("<script>alert('수정이 실패하였습니다.');history.back();</scrip>");
				}else{
					out.println("<script>alert('수정되었습니다.');location.href='../hotel.jsp';</script>");
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
