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
	.btncell{
		vertical-align: middle;
	}
</style>
</head>
<body>
		<jsp:include page="../../layout/header.jsp"/>

	<div class="alert alert-success list" style="width: 800px;">
		${loginid }
	</div>
	<div style="width: 800px;" class="list">
	<table class="table table-bordered" style="width: 800px;">
		<C:if test="${sessionScope.loginok!=null }">
		<tr>
			<td rowspan="5" width="250">
			<C:if test="${mdto.photo!='no' }">
					<img alt="" src="../membersave/${loginphoto }" width="200" height="200">
			</C:if>
			</td>
			<td>
				이름 : ${mdto.name }
			</td>
			<td colspan="2" rowspan="5" class="btncell">
				<button class="btn btn-outline-dark btn-sm">수정</button>
				<button class="btn btn-outline-danger btn-sm">삭제</button>
			</td>
		</tr>
		<tr>
			<td>
				id : ${mdto.id }
			</td>
		</tr>
		<tr>
			<td>
				hp : ${mdto.hp }
			</td>
		</tr>
		<tr>
			<td>
				이메일 : ${mdto.email }
			</td>
		</tr>
		<tr>
			<td>
				가입일 : <fmt:formatDate value="${mdto.gaipday }" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			
		</tr>
		</C:if>
	</table>
	</div>
</body>
</html>