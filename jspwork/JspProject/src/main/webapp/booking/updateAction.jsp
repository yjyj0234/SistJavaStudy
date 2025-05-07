<%@page import="booking.BookingDto"%>
<%@page import="booking.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
    

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	
	String gender=request.getParameter("gender");
	
	String bookday=request.getParameter("local");
	
	int inwon=Integer.parseInt(request.getParameter("inwon"));
	
	String [] food=request.getParameterValues("food");
	String num=request.getParameter("num");
	String foodname="";
	String foodprice="";
	for(String f:food){
		
		System.out.println(f);
		//,로 분리해서 없애기 name,뒤는 price, 추가
		String [] data=f.split(",");
		foodname+=data[0]+",";
		foodprice+=data[1]+",";
	}
	//반복문 나와서 마지막 , 지우기
	foodname=foodname.substring(0,foodname.length()-1);
	foodprice=foodprice.substring(0,foodprice.length()-1);
	
	String msg=request.getParameter("message");
	
	BookingDto dto=new BookingDto();
	
		dto.setNum(num);
		dto.setName(name);
		dto.setGender(gender);
		dto.setBookday(bookday);
		dto.setInwon(inwon);
		dto.setFoodphoto(foodname);
		dto.setFoodprice(foodprice);
		dto.setMessage(msg);
		dto.setNum(num);
		request.setCharacterEncoding("utf-8");
		
		BookingDao dao=new BookingDao();
		dao.updateBooking(dto);
		response.sendRedirect("bookingView.jsp?num="+num);
	%>
</body>
</html>