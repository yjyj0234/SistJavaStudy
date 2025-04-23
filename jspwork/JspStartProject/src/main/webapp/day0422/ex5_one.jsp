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
	<h3>ex5_oneInclude Include 하기</h3>
	<%
		//한글 꺠지는거 고치기용
		request.setCharacterEncoding("utf-8");
		/*
		include: 다른페이지의 결과를 현재파일에 포함시킨다
		forward: 다른페이지로 이동 (url주소 안바뀜)
		redirect:다른페이지로 이동 (url주소 바뀜..이동)
		
		*/

	%>
	
	<jsp:include page="ex5_oneInclude.jsp">
		<jsp:param value="오늘은 Jsp 1일차!!!" name="msg"/>
		<jsp:param value="../image/Food/1.jpg" name="imgname"/>
		<jsp:param value="홍길동" name="name"/>
		<jsp:param value="서울시 강서구" name="addr"/>
	</jsp:include>
	
</body>
</html>