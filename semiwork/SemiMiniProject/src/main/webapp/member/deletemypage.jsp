<%@page import="data.dto.memberDto"%>
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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		String num=request.getParameter("num");
		String pass=request.getParameter("pass");
		
		memberDao dao=new memberDao();
		memberDto dto=new memberDto();
		
		boolean b=dao.isPassCheck(num, pass);
		System.out.println(num);
				if(b){
					dao.deleteMember(num);
				%>
					<script type="text/javascript">
					alert("삭제되었습니다.");
					location.href="../index.jsp";
					</script>
				<%}else{%>
				
					<script type="text/javascript">
						alert("비밀번호가 일치하지 않습니다");
						history.back();
					</script>					
				<%}
	%>
</body>
</html>