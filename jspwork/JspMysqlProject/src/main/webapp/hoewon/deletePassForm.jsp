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
<style type="text/css">
	#wrap{
	position: absolute;
	left: 50%;
	top: 50%; 
	transform: translate(-50%,-50%);
	}
</style>
</head>
	<%
		String num=request.getParameter("num");
		//num 을 읽고 form에 hidden으로 넣는다
		System.out.println(num);
	%>
<body>
<div id="wrap">
	<form action="deleteAction.jsp">
	<input type="hidden" name="num" value="<%=num%>">
		<h4>비밀번호</h4>
		<input type="password" class="form-control"
		name="pass" style="width: 150px;" required="required">
		<br>
		<button type="submit" class="btn btn-danger btn-sm">삭제</button>
	</form>
</div>
</body>
</html>