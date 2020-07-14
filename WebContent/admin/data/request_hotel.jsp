<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.zimcarry.hotel.HotelDTO" id="hotelDTO"/>
<jsp:useBean class="com.zimcarry.hotel.HotelDAO" id="hotelDAO"/>
<%@ page import="java.util.*"%>
<%@ page import="com.zimcarry.hotel.HotelDTO"%>
<%
	String hName = null;
	int start = 0;
	int recNum = 0;
	String hIdx = null;
	
	if(request.getParameter("hIdx") != null){
		hIdx = request.getParameter("hIdx");
		
		request.setAttribute("hIdx1", hIdx);
		
		session.setAttribute("hIdx", hIdx);
		
		
		
		request.setAttribute("hDiscount", hotelDAO.viewHotel(hIdx).gethDiscount());
		request.setAttribute("hPartner", hotelDAO.viewHotel(hIdx).gethPartner());
		out.println(hotelDAO.viewHotel(hIdx));
	}

	if(request.getParameter("hName") != null){
		hName = request.getParameter("hName");
		start = Integer.parseInt(request.getParameter("start"));
		recNum = Integer.parseInt(request.getParameter("recNum"));
		//List<HotelDTO> hotelList = hotel 
	}
	
%>