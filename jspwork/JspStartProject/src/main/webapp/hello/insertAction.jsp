<%@page import="hello.HelloDao"%>
<%@page import="hello.HelloDto"%>
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

	String irum=request.getParameter("name");
	String juso=request.getParameter("addr");
	String hp=request.getParameter("hp");
	
	//입력데이터 dto로 묶어서
	HelloDto dto=new HelloDto();
	
	dto.setName(irum);
	dto.setAddr(juso);
	dto.setHp(hp);
	
	//insert메서드에 전달
	HelloDao dao=new HelloDao();
	dao.insertHello(dto);
	
	//목록으로 이동
	//response : 내가 요청한것을 띄워주는 역할
	response.sendRedirect("helloList.jsp");
%>
<body>
	
</body>
</html>