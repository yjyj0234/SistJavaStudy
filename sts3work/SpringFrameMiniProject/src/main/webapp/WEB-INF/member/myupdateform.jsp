<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="update" method="post" >
		<input type="hidden" name="num" value="${dto.num }" >
		<table class="table table-bordered" style="width: 500px;"> 
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th>회원명</th>
				<td>
					<input type="text" name="name" class="form-control"
					 required="required" style="width: 120px;" value="${dto.name }">
				</td>
			</tr>
			<tr>
				<th width="120">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-control"
					required="required" style="width: 200px;" >
				</td>
			</tr>
			<tr>
				<th width="120">전화번호</th>
				<td>
					<input type="text" name="hp" class="form-control"
					required="required" style="width: 200px;" value="${dto.hp }">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-info">수정</button>
					<button type="button" class="btn btn-info"
					onclick="location.href='list'">회원목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>