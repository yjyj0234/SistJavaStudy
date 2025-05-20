<%@page import="org.apache.tomcat.util.http.ResponseUtil"%>
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
		request.setCharacterEncoding("utf-8");
		String num=request.getParameter("num");
		memberDao dao=new memberDao();
		memberDto dto=dao.getData(num);
		
		String pass=request.getParameter("pass");
		String pass2=request.getParameter("pass2");
		String name=request.getParameter("name");
		
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		
		String email=email1+"@"+email2;
		
	
		
		
		/* boolean b=dao.isPassCheck(num, pass); */
		System.out.println(dto.getPass());
		if(dto.getPass().equals(pass)){
		
			dto.setPass(pass2);
			dto.setName(name);
			dto.setEmail(email);
			
			dao.memberUpdate(dto);
			
			response.sendRedirect("../index.jsp?main=member/mypage.jsp");
			
			
		}else{%>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다");
				history.back();
			</script>
		<%}
		
	%>
</body>
</html>