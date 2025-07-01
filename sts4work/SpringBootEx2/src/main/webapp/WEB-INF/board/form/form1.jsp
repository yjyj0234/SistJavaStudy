<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>폼데이터 각각 읽기</h1>
	<form action="read1" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th width="100">학생명</th>
				<td>
					<input type="text" name="name" class="form-control"
					style="width: 100px;" required="required">
				</td>
			</tr>
			<tr>
				<th width="100">자바점수</th>
				<td>
					<input type="text" name="java" class="form-control"
					style="width: 100px;" required="required">
				</td>
			</tr>
			<tr>
				<th width="100">스프링점수</th>
				<td>
					<input type="text" name="spring" class="form-control"
					style="width: 100px;" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">결과</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>