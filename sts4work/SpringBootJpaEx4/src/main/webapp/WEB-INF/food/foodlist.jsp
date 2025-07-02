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
	<table class="table table-bordered" style="width: 1000px;">
		<tr>
			<td style="text-align: center;" colspan="5">
				<button type="button" class="btn btn-outline-dark"
				onclick="location.href='form'">입력</button>
			</td>
		</tr>
		<tr>
			<th style="80">번호</th>
			<th style="120">음식이름</th>
			<th style="150">가격</th>
			<th style="180">입고일</th>
			<th style="220">사진</th>
		</tr>
		<C:forEach var="dto" items="${dto }" varStatus="i">
			<tr>
				<td>${i.count }</td>
			
				<td>${dto.foodname }</td>
			
				<td>${dto.foodprice }</td>
			
				<td>${dto.ipgoday }</td>
				<td>
				<C:forTokens items="${dto.foodphoto }" delims=","  var="photo">
					<img alt="" src="Food/${photo }" style="width: 100px; height: 80px;">
				</C:forTokens>
				</td>
			</tr>
		</C:forEach>
	</table>
</body>
</html>