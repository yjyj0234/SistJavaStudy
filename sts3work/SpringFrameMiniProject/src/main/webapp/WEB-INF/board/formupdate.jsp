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
	<form action="update" method="post" enctype="multipart/form-data">
		<!-- 답글 때문에 hidden값 넣어줘야함 -->
		<input type="hidden" name="num" value="${dto.num }">
		<input type="hidden" name="currentPage" value="${currentPage }">
		
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top"><b>
				수정폼			
			</b></caption>
			<tr>
				<th width="100">작성자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					style="width: 120px;" required="required" value="${dto.writer }">
				</td>
			</tr>
			<tr>
				<th width="100">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					style="width: 300px;" required="required" value="${dto.subject }">
				</td>
			</tr>
			<tr>
				<th width="100">사진</th>
				<td>
									<!-- 같은 이름(photo)으로 하면 업로드안됨 -->
					<input type="file" name="upload" class="form-control"
					style="width: 280px;" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea style="width: 480px; height: 100px;"
					name="content" class="form-control" required="required">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-secondary">수정</button>
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>