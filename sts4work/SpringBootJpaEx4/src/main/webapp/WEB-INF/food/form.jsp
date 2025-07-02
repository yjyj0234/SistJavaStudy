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
	<form action="insert" method="post">
		<table class="table table-bordered" style="width: 600px;">
			
			<tr>
				<th width="120">음식 이름</th>
				<td style="text-align: center;">
					<input type="text" name="foodname" class="form-control"
					style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th width="120">가격</th>
				<td style="text-align: center;">
					<input type="text" name="foodprice" class="form-control"
					style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th width="120">음식 사진</th>
				<td style="text-align: center;">
					<input type="checkbox" name="foodphoto" 
					value="1.jpg">햄에그샌드위치&nbsp;&nbsp;
						<input type="checkbox" name="foodphoto" 
					value="3.jpg">육칼&nbsp;&nbsp;
						<input type="checkbox" name="foodphoto" 
					value="5.jpg">콘치즈&nbsp;&nbsp;
						<input type="checkbox" name="foodphoto" 
					value="9.jpg">연근조림&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th width="120">입고날짜</th>
				<td style="text-align: center;">
					<input type="date" name="ipgoday" class="form-control"
					style="width: 200px;">
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<button type="submit" 
					class="btn btn-outline-dark" >등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>