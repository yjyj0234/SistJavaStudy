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
		request.setCharacterEncoding("utf-8");
		//세션이 있는지 확인 후 없으면 꽝
		
		//object라서 String으로 형변환 필수
		String msg=(String)session.getAttribute("msg");
		String travel=request.getParameter("travel");
		
		if(msg==null|| !msg.equals("happy")){%>
			<h3 style="color:red;">시간초과로 꽝입니다</h3>			
		<%}else{%>
			<h3>축하합니다 <%=travel %> 상품 당첨!!!</h3>
		<%}
	%>
	<a href="sessionStart.jsp">다시 선택하기</a>
</body>
</html>