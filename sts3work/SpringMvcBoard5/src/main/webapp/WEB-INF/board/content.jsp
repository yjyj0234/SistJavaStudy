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
	
	제목:${dto.subject }<br>
	
	작성자:${dto.writer }<br>
	작성일:
	<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/><br>
	<pre>
		내용:${dto.content }
	</pre>
		<button type="button" onclick="location.href='writeform'">글쓰기</button>
		<button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
		<button type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
		<button type="button" onclick="location.href='list'">목록</button>
	
</body>
</html>