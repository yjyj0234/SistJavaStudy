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
	<h2>제목:${title}</h2>
	<h2>업로드한 이미지 명 : ${fileName }</h2>
	<h2>업로드한 실제경로 : ${path }</h2>
	<h2>업로드한 이미지</h2>
	<c:if test="${fileName=='no' }">
		<b>이미지 없음</b>
	</c:if>
	<c:if test="${fileName!='no' }">
		<img alt="" src="../image/${fileName }" style="width: 300px;">
	</c:if>
	
</body>
</html>