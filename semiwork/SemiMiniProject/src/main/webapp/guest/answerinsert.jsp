<%@page import="data.dao.guestAnswerDao"%>
<%@page import="data.dto.guestAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String num=request.getParameter("num");
		String myid=request.getParameter("myid");
		String content=request.getParameter("content");
		
		guestAnswerDto dto=new guestAnswerDto();
		dto.setNum(num);
		dto.setMyid(myid);
		dto.setContent(content);
		guestAnswerDao dao=new guestAnswerDao();
		dao.insertGuestAnswer(dto);
		
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
	%>
</body>
</html>