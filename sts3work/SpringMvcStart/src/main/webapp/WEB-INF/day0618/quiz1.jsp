<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>${title }</h2><br>
	<b>이름 : ${stuName }</b><br>
	<!-- 이미지 출력할때 /start/ 이후 주소 체크해서 입력-->
	<div style="width: 300px; border: 1px solid black;">
		리소스 이미지
		<img alt="" src="../../res/17.png" width="300">
		<img alt="" src="../../res/image1/4.jpg" width="300">
	</div>
	<div style="width: 300px; border: 1px solid black; margin-top: 10px;">
		WEB-INF 이미지
		<img alt="" src="../../image/eventimg4.jpg" width="300">
		<img alt="" src="../../image/shop/store11.jpg" width="300">
	</div>
	
	
</body>
</html>