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
	div.list{
		width: 100%;
		width: 800px;
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>
		<jsp:include page="../../layout/header.jsp"/>

	<div class="alert alert-success list" style="width: 800px;">
		<b>총 ${totalCount }개의 상품이 입고 중입니다</b>
	</div>
	<div style="width: 800px;" class="list">
	<table class="table table-bordered" style="width: 800px;">
		<caption>
			<span style="float: right;">
				<button type="button" class="btn btn-info"
				onclick="location.href='form'">등록</button>
			</span>
		</caption>
		<C:forEach var="dto" items="${list }">
		<tr>
			<td rowspan="3" width="250">
			<C:if test="${dto.photoname!='no' }">
				<C:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
					<img alt="" src="../save/${pn }" width="200" height="200">
				</C:forTokens>
			</C:if>
			</td>
			<td>
				상품명 : ${dto.sangpum }
			</td>
			<td colspan="2" rowspan="3">
				<button class="btn btn-outline-dark btn-sm">수정</button>
				<button class="btn btn-outline-danger btn-sm">삭제</button>
			</td>
		</tr>
		<tr>
			<td>
				가격 : ${dto.price }
			</td>
		</tr>
		<tr>
			<td>
				입고일 : <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			
		</tr>
		</C:forEach>
	</table>
	</div>
</body>
</html>