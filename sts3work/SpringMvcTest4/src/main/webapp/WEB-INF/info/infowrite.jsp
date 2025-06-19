
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
	<table class="table table-bordered" style="width: 500px; margin: 10px 10px;">
	<tr>
		<th>이름</th> 
		<td>
			${dto.name }
		</td>
	</tr>
	<tr>
		<th>퍼스널 컬러</th> 
		<td>
			${dto.color }
		</td>
	</tr>
	 <tr>
		<th>취미</th> 
		<td>
		<c:if test="${empty dto.hobby }">없음</c:if>
			<c:if test="${!empty dto.hobby }">
				<c:forEach var="h" items="${dto.hobby }">
					[${h }]
				</c:forEach>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>가장 좋아하는 it언어</th>
		<td>
			${dto.language }	
		</td>
	</tr>
	 </table>
</body>
</html>
