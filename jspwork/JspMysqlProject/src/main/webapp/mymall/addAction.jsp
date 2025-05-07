<%@page import="mymall.MymallDto"%>
<%@page import="mymall.MymallDao"%>
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
		MymallDao dao=new MymallDao();
		
	
		String sangpum=request.getParameter("sangpum");
		String photo=request.getParameter("photo");
		String color=request.getParameter("color");
		int price=Integer.parseInt(request.getParameter("price"));
		String ipgoday=request.getParameter("ipgoday");
		
		MymallDto dto= new MymallDto();
		dto.setSangpum(sangpum);
		dto.setPhoto(photo);
		dto.setColor(color);
		dto.setPrice(price);
		dto.setIpgoday(ipgoday);
		
		dao.insertMymall(dto);
		
		response.sendRedirect("mallList.jsp");
	%>
</body>
</html>