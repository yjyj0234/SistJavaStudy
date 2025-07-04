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
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;">
			
			<tr>
				<th width="120">상품명</th>
				<td style="text-align: center;">
					<input type="text" name="sangpum" class="form-control"
					style="width: 200px;" required="required">
				</td>
			</tr>
			<tr>
				<th width="120">가격</th>
				<td style="text-align: center;">
					<input type="text" name="price" class="form-control"
					style="width: 200px;" required="required">
				</td>
			</tr>
			<tr>
				<th width="120">음식 사진</th>
				<td style="text-align: center;">
				<!-- 이름이 db의 photoname과 같으면 안됨 -->
					<input type="file" name="photo" class="form-control">
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