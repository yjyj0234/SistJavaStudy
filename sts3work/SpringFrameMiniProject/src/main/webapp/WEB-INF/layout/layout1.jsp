<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.layout{
	
	position: absolute;
}

div.title {
	height: 80px;
	line-height: 80px;
	font-size: 30pt;
	font-family: 'Sunflower';
	text-decoration: none;
	width: 100%;
	text-align: center;
	
	}

div.menu {
	width: 100%;
	height: 80px;
	top: 100px;
	
	font-family: 'Sunflower';
	font-size: 20pt;
	line-height: 80px;
	text-align: center;
	font-family: 'Sunflower';
	font-size: 20pt;
}

div.info {
	width: 180px;
	height: 200px;
	line-height: 10px;
	font-size: 15pt;
	top: 400px;
	padding: 20px 10px;
	border: 5px solid purple;
	border-radius: 30px;
	margin-left: 30px;
}

div.main {
	
	width: 1300px;
	height: 650px;
	font-size: 12pt;
	font-family: 'Sunflower';
	left: 280px;
	top: 330px;
	
}


</style>
</head>
<body>
	<div class="layout title">
		<tiles:insertAttribute name="title"/>
	</div>
	<div class="layout menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="layout info">
		<tiles:insertAttribute name="info"/>
	</div>
	<div class="layout main">
		<tiles:insertAttribute name="main"/>
	</div>
</body>
</html>