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
	<form action="carupdate" method="post">
	<input type="hidden" name="num" value="${dto.num }" >
	<table class="table table-bordered" style="width: 400px;">
		<caption align="top"><b>자동차 정보</b></caption>
		<tr>
			<th width="100">자동차명</th>
			<td>
				<input type="text" name="carname" class="form-control"
				style="width: 100px;" required="required" value="${dto.carname }">
			</td>
		</tr>
		<tr>
			<th width="100">차 가격</th>
			<td>
				<input type="text" name="carprice" class="form-control"
				style="width: 280px;" required="required" value="${dto.carprice }">
			</td>
		</tr>
		<tr>
			<th width="100">차 색상</th>
			<td colspan="2">
				<input type="color" name="carcolor" class="form-control"
				style="width: 280px;" required="required" value="${dto.carcolor }">
			</td>
		</tr>
		<tr>
			<th width="100">차 구입일</th>
			<td colspan="2">
				<input type="date" name="carguip" class="form-control"
				style="width: 280px;" required="required" value="${dto.carguip }" 
				readonly="readonly">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-outline-success"
			style="width: 150px;">수정</button>
			<button type="button" class="btn btn-outline-info"
			style="width: 150px;" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>