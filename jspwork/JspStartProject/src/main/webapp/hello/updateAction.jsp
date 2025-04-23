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
	
//데이터 읽어서 dto넣기 

//hidden이어도 num은 넘긴다
	String num=request.getParameter("num"); 

	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	String hp=request.getParameter("hp");
	
	HelloDto dto=new HelloDto();
	
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	dto.setHp(hp);
	
	HelloDao dao = new HelloDao();
	
	//dao의 update 메서드 호출해서 수정된 dto를 넘긴다
	dao.updateHello(dto);
	
	//목록파일로 이동
	response.sendRedirect("helloList.jsp");
%>
<body>
	
</body>
</html>