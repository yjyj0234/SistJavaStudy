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
</head>
<body>
	<%
		String id= request.getParameter("id");
		String pass= request.getParameter("pass");
		
		//체크박스 세이브체크(체크하면 on 안하면 null)
		String cbsave=request.getParameter("savechk");
		
		memberDao dao=new memberDao();
		boolean b=dao.isIdPass(id, pass);
		
		//아이디와 비번이 맞으면 3개의 세션 저장 후 로그인 메인으로
		
		if(b){
			//세션 저장
			session.setMaxInactiveInterval(60*60*8);//8시간 동안(생략하면 30분)
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			session.setAttribute("saveok", cbsave==null?null:"yes");
			
			//로그인 메인
			response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
		}else{%>
		<script type="text/javascript">
			alert("아이디나 비밀번호가 일치하지 않습니다");
			history.back();
		</script>
		<%}
	%>
	
</body>
</html>