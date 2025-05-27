<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
 div.layout{
 
 	
 	position: absolute;
 	
 }
 div.title{
 	width: 100%;
 	height: 80px;
 	line-height: 80px;
 	font-size: 30pt;
 	font-family: 'Sunflower';
 	text-align: center;
 	text-decoration: none;
 }
 div.menu{
 	width: 100%;
 	height: 80px;
 	top: 100px;
 	text-align: center;
 	font-family: 'Sunflower';
 	font-size: 20pt;
 	line-height:80px;
 }
 div.info{
 	width: 200px;
 	height: 200px;
 	line-height: 10px;
 	font-size: 15pt;
 	top:400px;
 	padding: 20px 10px;
 	border: 5px solid purple;
 	border-radius: 30px;
 	margin-left: 30px;
 	
 }
 div.main{
 	border: 1px solid gray;
 	width: 1400px;
 	height: 650px;
 	font-size: 12pt;
 	font-family: 'Sunflower';
 	left:280px;
 	top:330px;
 	text-align:center;
 }
a{
	/* !important:다른것 보다 먼저 적용됨 */
	text-decoration: none !important;
}

</style>
</head>
<%
	/* 바디라고 요청하면 메인페이지라고 두겠다 */
	String mainPage="layout/main.jsp";
	if(request.getParameter("main")!=null){
		mainPage=request.getParameter("main");
	}
	
%>
<body>

<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout info">
	<jsp:include page="layout/sideinfo.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>
</body>
</html>