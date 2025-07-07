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
	body{
		width: 100%;
		text-align: center;
		
	}
	ul{
		list-style: none;
		padding-left: 0;
		display: flex;
		justify-content: center;
		gap:20px;
	}
	li>a{
		text-decoration: none;
		color: white;
		font-weight: bold;
		border-radius:20px;
		background-color: darkgreen;
		padding: 10px 20px; /* 상하 10px, 좌우 20px */
   		display: inline-block; /* 패딩 적용을 위해 필요 */
	}
	a:hover{
		background-color: green;
		color: black;
		
	}
	
</style>
</head>
<body>
	<!--프로젝트 절대경로 -->
	<C:set var="root" value="<%=request.getContextPath() %>"/>
	
	<!-- 제목클릭 시 메인페이지 이동 -->
	<h2><a href="${root }"><img src="${root }/logoImg/img4.jpg"
	height="200"></a>
	</h2>
	<ul>
		<li>
			<a href="${root }/">Home</a>
		</li>
		<li>
			<a href="${root }/ipgo/list">상품목록</a>
		</li>
		<li>
			<a href="${root }/member/list">회원가입</a>
		</li>
		<li>
			<a href="${root }/login/form">로그인</a>
		</li>
		<li>
			<a href="${root }/board/list">회원게시판</a>
		</li>
	</ul>
</body>
</html>