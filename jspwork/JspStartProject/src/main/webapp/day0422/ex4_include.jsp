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
	<h2>다른 파일 include해보기</h2>
	<h3>1번예제</h3>	
	<b>================================================</b>
	<jsp:include page="./ex1Hellojsp.jsp"></jsp:include>
	<h3>2번예제</h3>	
	<b>================================================</b>
	<jsp:include page="./ex2.jsp"></jsp:include>
	<h3>3번예제</h3>	
	<b>================================================</b>
	<jsp:include page="./ex3.jsp"></jsp:include>
</body>
</html>