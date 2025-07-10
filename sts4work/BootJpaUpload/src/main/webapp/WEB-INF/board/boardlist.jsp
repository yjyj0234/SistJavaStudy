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
<style type="text/css">
	a{
		text-decoration: none;
		font-weight: bold;
		color: black;
	}
</style>
</head>
<body>
	<button type="button" class="btn btn-outline-dark"
	onclick="location.href='form'">글작성하기</button><br><br>
	
	<div style="width: 800px;">
	<h6 class="alert alert-success">총 ${count }개의 게시글이 있습니다</h6>
		<table class="table table-bordered" style="width: 800px;">
		
			<tr>
				<th width="50">번호</th>
				<th width="200">제목</th>
				<th width="120">작성자</th>
				<th width="180">작성일</th>
			</tr>
			<C:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>
						${count-i.index}
					</td>
					<td><a href="detail?num=${dto.num }">${dto.subject}</a>
					<C:if test="${dto.photo!='no' }">
						<i class="bi bi-file-image" style="color: gray;"></i>
					</C:if>
					</td>
					<td>${dto.writer }</td>
					<td>
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
			</C:forEach>
		</table>
	</div>
	<!-- 목록형: 번호 제목 작성자 작성일 제목누르면 디테일로 이동 -->
	
</body>
</html>