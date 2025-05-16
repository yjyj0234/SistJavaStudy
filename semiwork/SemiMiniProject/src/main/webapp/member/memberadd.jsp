<%@page import="data.dao.memberDao"%>
<%@page import="data.dto.memberDto"%>
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
		//프로젝트 경로 구하기
		String root=request.getContextPath();
	
		//한글
		request.setCharacterEncoding("utf-8");
		
		//데이터 읽어서 dto넣기
		memberDto dto=new memberDto();
		memberDao dao=new memberDao();
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email1")+"@"+request.getParameter("email2");
		
		
		dto.setName(name);
		dto.setId(id);
		dto.setPass(pass);
		dto.setEmail(email);
		
		dao.insertMember(dto);
		//가입성공페이지로 이동
		response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);
		
	%>
</body>
</html>