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
	<c:if test="${totalCount==0 }">
		<h3 class="alert alert-info">저장된 자동차 정보가 없습니다</h3>
	</c:if>
	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">총 ${totalCount }개의 자동차 정보가 있습니다</h3>
	</c:if>
	
	<br>
	<button type="button" class="btn btn-primary"
	 onclick="location.href='writeform'">차 정보 입력</button>
	 
	 <table class="table table-bordered" style="width: 800px;">
	 	<tr>
	 		<th width="80">번호</th>
	 		<th width="120">차종</th>
	 		<th width="120">차량가격</th>
	 		<th width="100">색상</th>
	 		<th width="120">구입일</th>
	 		<th width="180">차량등록일</th>
	 		<th width="150">수정삭제</th>
	 	</tr>
	 	<c:forEach var="dto" items="${ list}" varStatus="i">
		 	<tr>
		 	<td>${totalCount-i.index }</td>
	 		<td>${dto.carname }</td>	
	 		<td>
	 		<fmt:formatNumber type="Currency">${dto.carprice }</fmt:formatNumber>
	 		</td>
	 		<td style="background-color: ${dto.carcolor }">${dto.carcolor }</td>
	 		<td>${dto.carguip }</td>
	 		<td>
	 		<fmt:formatDate value="${dto.carwriteday }" pattern="yyyy-MM-dd HH:mm"/>
	 		</td>
	 		
	 		<td>
	 			<button class="btn btn-info btn-sm" type="button" 
	 			onclick="location.href='updateform?num=${dto.num}'">수정</button>
	 			<button class="btn btn-danger btn-sm" type="button" 
	 			onclick="location.href='delete?num=${dto.num}'">삭제</button>
	 		</td>
		 	</tr>
	 	</c:forEach>
	 </table>
</body>
</html>