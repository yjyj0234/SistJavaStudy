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
<%
	//세션으로부터 아이디 얻기
	String myid=(String)session.getAttribute("myid");
	
	//db에서 id에 해당하는 이름 얻기
	memberDao dao=new memberDao();
	String name=dao.getName(myid);
%>
	<div style="margin:100px 120px; width:700px;">
		<b><%=name%>님 로그인 중</b>&nbsp;
		<img alt="" src="image/쇼핑몰사진/14.jpg" align="right" width="400"><br><br>
		
		<button type="button" class="btn btn-danger" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
		
	</div>
</body>
</html>