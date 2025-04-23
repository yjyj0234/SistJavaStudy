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
	<h2>여기는 forward Page입니다</h2>
	<img alt="" src="../image/Food/2.jpg">
	<%
	
		String irum=request.getParameter("name");
		String hand=request.getParameter("hp");
		
	%>
	<h2>이름: <%=irum %></h2>
	<h2>핸드폰: <%=hand %></h2>
</body>
</html>