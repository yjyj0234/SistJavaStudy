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
		<table>
			<caption align="top"><b>자동차 정보입력</b></caption>
			<tr>
				<th width="100">차종</th>
				<td>
					<input type="text" name="carname" class="form-control"
					 style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th width="100">가격</th>
				<td>
					<input type="text" name="carprice" class="form-control"
					 style="width: 200px;">
				</td>
			</tr>
			<tr>
				<th width="100">색상</th>
				<td>
					<input type="color" name="carcolor" class="form-control"
					 style="width: 200px;" value="#fff">
				</td>
			</tr>
			<tr>
				<th width="100">구입일</th>
				<td>
					<input type="date" name="guipday" class="form-control"
					 style="width: 200px;" value="2025-06-01">
				</td>
			</tr>
			<tr>
				
				<td>
				<button type="submit" class="btn btn-outline-info">저장</button>&nbsp;
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>