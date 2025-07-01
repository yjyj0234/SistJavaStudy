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
	<form action="foodshow" method="post">
		<div style="width: 700px; border: 1px solid gray; padding: 10px 10px;">
				<div class="input-group" >		
				<b>음식이름</b>&nbsp;&nbsp;
				<input type="text" name="fname" class="form-control"
				style="width: 100px;">
				</div><br><br>
				<div class="input-group" >		
				<b>가격</b>&nbsp;&nbsp;
				<input type="text" name="fprice" class="form-control"
				style="width: 100px;">
				</div>	<br><br>
				<b>음식사진</b>&nbsp;&nbsp;
				<div class="form-control" >		
					<input type="checkbox" name="fphoto" value="1.jpg" >1 &nbsp;&nbsp;
					<input type="checkbox" name="fphoto" value="2.jpg">2 &nbsp;&nbsp;
					<input type="checkbox" name="fphoto" value="10.jpg">10 &nbsp;&nbsp;
					<input type="checkbox" name="fphoto" value="11.jpg">11
				</div>
			<br>
				<span class="select">선택한 이미지</span>
				<button type="submit" class="btn btn-dark">결과는?</button>
			
		</div>
		
	</form>
</body>
</html>