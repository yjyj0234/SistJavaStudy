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
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td align="top">
			<h3>${dto.subject }</h3>
			<br>
			<span style="float: right;">
				<b>${dto.writer }</b>
			</span><br>
			<span style="float: right; color: gray;">
			조회  ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd hh:mm"/>
			</span>
			</td>
		</tr>
		<tr>
			<td>
				<pre style="text-align: left;">${dto.content }
				</pre>
				<c:if test="${dto.photo!=no }">
			<c:forTokens var="im" items="${dto.photo }" delims=",">
				<a href="../photo${im }"><img src="../photo/${im }"
				style="width: 200px; height: 200px;"> </a>
			</c:forTokens>
		</c:if>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<button type="button" class="btn btn-outline-warning"
				onclick="location.href='form'">글쓰기</button>
					<button type="button" class="btn btn-outline-info"
				onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currnetPage }'">
				답글쓰기</button>
					<button type="button" class="btn btn-outline-dark"
				onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-outline-danger"
				onclick="location.href=''">삭제</button>
					<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='list'">목록</button>
			</td>
		</tr>
		
	</table>
</body>
</html>