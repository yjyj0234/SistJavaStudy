<%@page import="hoewon.hoewonDao"%>
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
		//String loginok=(String)session.getAttribute("loginok");
		hoewonDao dao=new hoewonDao();
		
		//세션에 저장된 id
		String id=(String)session.getAttribute("mid");
		
		//아이디에 해당하는 이름 반환
		String name=dao.getHoewonName(id);
	%>
	<div style="margin: 200px 200px;">
	<b><%=name %>님 로그인 중</b>
	<button type="button" class="btn btn-danger btn-sm" onclick="location.href='logoutproc.jsp'">logout</button>
	<img alt="" src="../image/logoImg/toy05.png">
	</div>
</body>
</html>