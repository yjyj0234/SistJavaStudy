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
<style type="text/css">
	
</style>
</head>
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();
	//로그인 세션
	String loginok=(String)session.getAttribute("loginok");
	//id
	String myid=(String)session.getAttribute("myid");
	
	//dao,id=>name
	memberDao dao=new memberDao();
	String name=dao.getName(myid);
	
%>
<body>
	
		<a href="<%=root%>/" style="color: black; position: absolute;">
		SSY.COM
		</a>
		<div style="float: right; padding-right: 50px; height: 50px;">
		<%
			if(loginok==null){%>
				<button type="button" class="btn btn-success btn-sm" 
				 onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>				
			<%}else{%>
			<b style="font-size: 10pt;"><%=name %>님이 로그인하였습니다.</b>
				<button type="button" class="btn btn-danger btn-sm"
				onclick="location.href='index.jsp?main=login/logoutaction.jsp'">로그아웃</button>
			<%}
		%>
	</div>
	
	
</body>
</html>