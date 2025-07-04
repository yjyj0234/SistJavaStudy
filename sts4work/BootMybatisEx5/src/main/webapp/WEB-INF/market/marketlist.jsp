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
	<C:if test="${totalCount==0 }">
		<div class="alert alert-info">
			<b>저장된 정보가 없습니다</b>
		</div>
	</C:if>
	<C:if test="${totalCount gt 0 }">
		<div class="alert alert-info">
			<b>총 ${totalCount }개의 상품이 입고되었습니다.</b>
		</div>
	</C:if>
	<button type="button" class="btn btn-outline-dark" 
	onclick="location.href='insertform'">상품 입력</button><br>
	<C:forEach items="${list }" var="a">
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<td>
						<C:if test="${a.photoname!='no' }">
							<img alt="" src="photo/${a.photoname }" style="width: 150px; height: 130px;"
							align="left" hspace="20">
						</C:if>
						<C:if test="${a.photoname=='no' }">
							<img alt="" src="photo/noimage.png" style="width: 150px; height: 130px;"
							align="left" hspace="20">
						</C:if>
						<h4>상품명: ${a.sangpum }</h4>
						<h4>가격: <fmt:formatNumber value="${a.price }" type="currency"/> </h4>
						<h4>입고날짜: <fmt:formatDate value="${a.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></h4>
						<button type="button" class="btn btn-success" 
						onclick="location.href='updateform?num=${a.num}'">수정</button>&nbsp;
						<button type="button" class="btn btn-danger" 
						onclick="location.href='delete?num=${a.num}'">삭제</button>	
					</td>
				</tr>
			</table>
	</C:forEach>
</body>
</html>