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
	table {
	margin: 0 auto;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../../layout/header.jsp"/>
	</div>
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>게시판 입력</b></caption>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					style="width: 350px;" required="required">
				</td>
			</tr>
			<tr>
				<th>업로드</th>
				<td>
					<input type="file" name="upload" class="form-control"
					style="width: 200px;" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="" cols=""
					style="width: 480px; height: 100px;"
					name="content" required="required" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-success">저장</button>
					<button type="button" class="btn btn-success"
					onclick="location.href='list'">목록</button>
				</td>
				
			</tr>
		</table>		
	</form>
</body>
</html>