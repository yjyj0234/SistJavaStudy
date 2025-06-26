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
	function confirmdel(num){
		var c=confirm("탈퇴하시겠습니까?");
		if(c){
			location.href="delete?num="+num;
		}
	}
</script>
	<div style="width: 700px;">
		<table class="table table-boredered">

			<c:forEach var="dto" items="${list }">
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">

					<tr>
						<td style="width: 300px;" align="center" rowspan="5"><img
							alt="" src="../image/SemiImg/mycar4.png" style="width: 300px;">
						</td>
					</tr>
					<tr>
						<td>회원명 : ${dto.name }</td>
						<td rowspan="4">
							<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='updateform?num=${dto.num}'">수정</button><br><br>
							<button type="button" class="btn btn-outline-danger" id="bye"
							onclick="confirmdel('${dto.num}')">탈퇴</button>
						</td>
					</tr>
					<tr>
						<td>${dto.id }</td>
					</tr>
					<tr>
						<td>${dto.hp }</td>
					</tr>
					<tr>
						<td>
						<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>