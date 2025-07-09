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
	.list{
		text-align: center;
		margin: 0 auto;
	
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="../../layout/header.jsp"/>
	</div>
	<table class="table table-bordered list" style="width: 800px;">
		<caption align="top"><b>전체회원명단</b></caption>
		<tr align="center">
			<th width="100">번호</th>
			<th width="120">ID</th>
			<th width="120">이름</th>
			<th width="180">전화번호</th>
			<th width="120">이메일</th>
			<th width="120">가입일</th>
			<th width="180">
			<input type="checkbox" id="allcheck">
			강퇴
			</th>				
		</tr>
		<C:forEach var="dto" items="${list }" varStatus="i">	
		<tr>
			<td>${i.count }</td>
			<td>${dto.id }</td>
			<td>${dto.name }</td>
			<td>${dto.hp }</td>
			<td>${dto.email }</td>
			<td>
				<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			<td>
				<input type="checkbox" class="del" num="${dto.num }">
			</td>
		</tr>
		</C:forEach>
	</table>
	<button type="button" class="btn btn-danger" style="margin-left: 700px;"
id="btnmemberdel">Delete</button>
</body>
</html>