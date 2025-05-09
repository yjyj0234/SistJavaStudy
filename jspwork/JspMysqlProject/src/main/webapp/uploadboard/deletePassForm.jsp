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
	String num=request.getParameter("num");
	
%>
</body>
<div style="margin: 200px 200px;">

<form action="deleteAction.jsp" method="post">
	<table class="table table-bordered" style="width: 250px;">
		<caption align="top"><b>삭제비밀번호입력</b></caption>
		<tr>
			<th>비밀번호 입력해주세요<br><br>
				<input type="password" name="pass" class="form-control"
				style="width:150px;" required="required">
				<br><br>
				
				<!-- hidden num  -->
				<input type="hidden" name="num" value="<%=num%>">
				
				<button type="submit" class="btn btn-danger">삭제</button>
				<!-- 이전으로 돌아가기 -->
				<button type="button" class="btn btn-warning" onclick="history.back()">이전</button>
			</th>
		</tr>
	</table>
</form>
</div>
</html>