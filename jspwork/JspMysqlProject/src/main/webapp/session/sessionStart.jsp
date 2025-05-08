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
		//세션 저장
		session.setAttribute("msg", "happy");
		session.setMaxInactiveInterval(10); //10sec
		
	%>
	<h2>10초 안에 선택하세요</h2>
	<form action="sessionAction.jsp" method="post">
		<h2>가고 싶은 여행지는?</h2>
		<input type="radio" value="미국일주" name="travel">미국일주&nbsp;
		<input type="radio" value="일본오사카" name="travel">일본오사카&nbsp;
		<input type="radio" value="동유럽체코" name="travel">동유럽체코&nbsp;
		<input type="radio" value="일본마쓰야마" name="travel">일본마쓰야마&nbsp;
		<input type="radio" value="태국방콕" name="travel">태국방콕&nbsp;
		<input type="radio" value="일본삿포로" name="travel" checked="checked">일본삿포로&nbsp;
		<input type="submit" value="여행선택" class="btn btn-success">
	</form>
	
</body>
</html>