<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>
	<pre>
	이름:${foodDto.fname } <br>
	가격:${foodDto.fprice } 
	${foodDto.fphoto}<br>
	
	</pre>
	</h3>
	<div>
		음식사진<br>
		<C:forTokens var="dto" items="${foodDto.fphoto }" delims=",">
			<img alt="" src="image/Food/${dto }">
		</C:forTokens>
		
			<C:forEach var="dto" items="${foodDto.fphoto.split(',') }" begin="0" end="1">
				<img alt="" src="image/Food/${dto }">
			</C:forEach>
	</div>
	 
	 <C:set var="photo" value="${foodDto.fphoto.split(',')[0] }" />
	 ${photo }
	
</body>
</html>