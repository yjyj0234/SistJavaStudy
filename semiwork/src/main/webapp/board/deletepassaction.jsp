<%@page import="data.dao.boardDao"%>
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
		String pass=request.getParameter("pass");
		String num=request.getParameter("num");
		boardDao dao=new boardDao();
		
		boolean b=dao.isEqualPass(num, pass);
		if(b){
			dao.deleteBoard(num);
			response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
		}else{%>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
		<%}
		
		
		System.out.println(pass);
	%>
	
	
</body>
</html>