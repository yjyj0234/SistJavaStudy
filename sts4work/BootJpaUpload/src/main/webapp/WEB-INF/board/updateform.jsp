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
	#myimg{
		position: absolute;
		left: 730px;
		top: 100px;
		max-width: 300px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#myphoto").change(function(e) {
	        const file = e.target.files[0];
	        if (file) {
	            const reader = new FileReader();
	            
	            reader.onload = function(event) {
	                $("#myimg").attr("src", event.target.result);
	            };
	           reader.readAsDataURL(file);
	 }
	})

	});
</script>
</head>
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<th width="120">작성자</th>
				<td style="text-align: center;">
					<input type="text" name="writer" class="form-control"
					style="width: 200px;" value="${dto.writer }">
				</td>
			</tr>
			<tr>
				<th width="120">제목</th>
				<td style="text-align: center;">
					<input type="text" name="subject" class="form-control"
					style="width: 200px;" required="required" value="${dto.subject }">
				</td>
			</tr>
			<tr>
				<th width="120">상품이미지</th>
				<td style="text-align: center;">
					<input type="file" name="upload" class="form-control"
					style="width: 300px;" value="${dto.photo }" id="myphoto"> 
				</td>
			</tr>
			<tr>
				<th width="120">내용</th>
				<td style="text-align: center;">
					<textarea rows="" cols="" style="width: 400px;" name="content"
					class="form-control">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<button type="submit" 
					class="btn btn-outline-dark" >수정</button>
					<button type="button" class="btn btn-outline-primary" 
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
		<div >
			<img alt="" src="../save/${dto.photo }" id="myimg">	
		</div>
	</form>
	
</div>

</body>
</html>