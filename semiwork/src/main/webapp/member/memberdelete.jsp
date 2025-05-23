<%@page import="data.dao.memberDao"%>
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
	<!-- 관리자가 회원강퇴처리하는 페이지  -->
	<%
			memberDao dao=new memberDao();
			String num=request.getParameter("num");
			dao.deleteMember(num);
			
			//상위로 올라가야함
			//main화면을 memberlist로 바꾸겠다
			response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
			
	%>
	
</body>
</html>