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
<style>
	
</style>
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();
%>
<div style="width: 1200px; height: 500px; border: 1px solid gray;
			position: absolute;
			top: 10%;
			left: 5%;
">
<!-- object-fit: cover
이미지 비율은 유지하면서
div 영역을 빈틈없이 꽉 채움
대신 일부는 잘릴 수 있음 (자연스러운 잘림) -->
	<img alt="" src="image/mall/main.jpg" style="width: 1200px; height: 100%; ">
</div>



</body>
</html>