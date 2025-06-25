<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
				$(function() {
					$(".banMember").click(function() {
						const num=$(this).attr("num");
						console.log(num);
						var c = confirm("강퇴하시겠습니까?");
						if (c) {
							$.ajax({
								type : "get",
								dataType : "html",
								data : {
									"num" : num
								},
								url : "ban",
								success : function(res) {
									alert("처리 완료.");
									location.reload();
								}
							});
						}
					})

				});
			</script>
	<h1>멤버리스트</h1>
	<button type="button" class="btn btn-success"
		onclick="location.href='form'">회원가입폼</button>

	<table class="table table-bordered" style="width: 800px;">
		<caption align="top">
			<b>전체회원명단</b>
		</caption>
		<tr class="table-warning">
			<th width="100">번호</th>
			<th width="120">아이디</th>
			<th width="120">회원명</th>
			<th width="150">핸드폰</th>
			<th width="180">가입일</th>
			<th width="100">강퇴</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>${dto.id }</td>
				<td>${dto.name }</td>
				<td>${dto.hp }</td>
				<td><fmt:formatDate value="${dto.gaipday }"
						pattern="yyyy년 MM월 dd일" /></td>
				<td>
				<!-- 버튼 작동하려면 id대신 class -->
					<button type="button" class="btn btn-danger banMember"  num="${dto.num }">강퇴!!</button>
				</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>