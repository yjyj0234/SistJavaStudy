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


div.title {
	height: 80px;
	line-height: 80px;
	font-size: 30pt;
	font-family: 'Sunflower';
	text-align: center;
	text-decoration: none;
	     
}

div.menu {
	width: 100%;
	height: 80px;
	top: 100px;
	text-align: center;
	font-family: 'Sunflower';
	font-size: 20pt;
	line-height: 80px;
	top: 100px;
	text-align: center;
	font-family: 'Sunflower';
	font-size: 20pt;
}

div.main {
	
	width: 100%;
	height: 650px;
	font-size: 12pt;
	font-family: 'Sunflower';
	left: 280px;
	top: 330px;
	text-align: center;
}

</style>
</head>
<body>
	<div class="layout title">
		<tiles:insertAttribute name="title2"/>
	</div>
	<div class="layout menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="layout main">
		<tiles:insertAttribute name="main"/>
	</div>
</body>
</html>