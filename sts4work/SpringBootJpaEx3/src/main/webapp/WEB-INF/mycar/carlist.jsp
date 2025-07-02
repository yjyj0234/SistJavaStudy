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
<script type="text/javascript">
	function funDel(num){
		var a=confirm("삭제하시겠습니까?"+num);
		if(a){
			location.href="delete?num="+num;
		}
	}
</script>
</head>
<body>
<h3 class="alert alert-success">총 ${totalCount }개의 차량이 등록됨.</h3>
	<table class="table table-bordered" style="width: 1000px;">
		<tr>
			<td colspan="7" style="text-align: center;">
				<button type="button" class="btn btn-dark"
				onclick="location.href='carform'">등록</button>
			</td>
		</tr>
		<tr>
			<th width="80">번호</th>
			<th width="100">차종</th>
			<th width="110">색상</th>
			<th width="180">가격</th>
			<th width="150">구입일</th>
			<th width="150">등록일</th>
			<th width="150">편집</th>
		</tr>
		<C:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.carname }</td>
				<td>
    				<div style="width: 20px; height: 20px; background-color: ${dto.carcolor}; border: 1px solid #ccc; display: inline-block; vertical-align: middle; margin-right: 5px;">
    				</div>
    				${dto.carcolor} 
				</td>
				<td>
				<fmt:formatNumber type="currency" 
				currencyCode="KRW" value="${dto.carprice }"/>
				
				</td>
				<td>${dto.guipday }</td>
				<td>
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd hh:mm"/>
				</td>
				<td>
					<button type="button" class="btn btn-outline-warning btn-sm"
					onclick="location.href='updateform?num=${dto.num }'">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
					onclick="funDel(${dto.num})">삭제</button>
				</td>
			</tr>
		</C:forEach>
	</table>
	
</body>
</html>