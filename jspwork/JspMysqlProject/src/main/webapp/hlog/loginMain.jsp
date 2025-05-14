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
		String loginok=(String)session.getAttribute("loginok");
		//로그아웃상태
		if(loginok==null||loginok.equals(""))
		{%>
			<jsp:include page="loginForm.jsp"/>	
		<%}else{%>
			<jsp:include page="logoutForm.jsp"/>
		<%}
	%>
</body>
</html>