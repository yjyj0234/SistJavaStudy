<%@page import="hello.HelloDto"%>
<%@page import="hello.HelloDao"%>
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
<%
	request.setCharacterEncoding("utf-8");
	
//num값에 따라 delete 해줘야 하므로 num 값은 무조건 있어야 함
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	String hp=request.getParameter("hp");
	String num=request.getParameter("num");
	
	HelloDto dto=new HelloDto();
	dto.setName(name);
	dto.setAddr(addr);
	dto.setHp(hp);
	dto.setNum(num);
	
	HelloDao dao=new HelloDao();
	dao.deleteHello(dto);

	response.sendRedirect("helloList.jsp");
%>
<body>
	
</body>
</html>