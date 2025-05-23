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
		String id=request.getParameter("id");
	//아이디를 통해 name불러오기
		memberDao dao=new memberDao();
		
		String name=dao.getName(id);
	
	%>
	<div style="margin: 0 auto; width: 100%">
	<img alt="" src="image/avata/b7.png">
		<b><%=id %>,<%=name %>님 회원가입을 축하합니다</b>
	</div>
	<br><br>
	<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
	<button type="button" class="btn btn-primary" onclick="location.href='index.jsp'">홈</button>
</body>
</html>