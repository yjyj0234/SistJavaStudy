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
    .ipgo-card-list {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
        gap: 2rem;
        max-width: 900px;
        margin: 0 auto;
        padding: 2rem 0 1rem 0;
    }
    .ipgo-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        padding: 1.5rem 1.2rem 1.2rem 1.2rem;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 340px;
        position: relative;
        transition: box-shadow 0.18s;
    }
    .ipgo-card:hover {
        box-shadow: 0 4px 24px rgba(0,0,0,0.13);
    }
    .ipgo-card img {
        width: 180px;
        height: 180px;
        object-fit: cover;
        border-radius: 12px;
        margin-bottom: 1rem;
        background: #f8f9fa;
    }
    .ipgo-card .ipgo-title {
        font-size: 1.15rem;
        font-weight: 600;
        color: #232323;
        margin-bottom: 0.5rem;
    }
    .ipgo-card .ipgo-price {
        color: #1976d2;
        font-weight: 500;
        margin-bottom: 0.5rem;
    }
    .ipgo-card .ipgo-date {
        color: #888;
        font-size: 0.97rem;
        margin-bottom: 1.2rem;
    }
    .ipgo-card .ipgo-btns {
        display: flex;
        gap: 0.5rem;
        width: 100%;
        justify-content: center;
        position: absolute;
        bottom: 1.2rem;
        left: 0;
    }
    .btn-ipgo {
        background: #e3f0ff;
        color: #1976d2;
        border: 1px solid #b6d4fe;
        font-weight: 500;
        border-radius: 8px;
        transition: background 0.18s, color 0.18s;
        min-width: 70px;
    }
    .btn-ipgo:hover {
        background: #1976d2;
        color: #fff;
        border-color: #1976d2;
    }
    .alert-success.list {
        background: #f8f9fa;
        color: #232323;
        border-radius: 14px;
        box-shadow: 0 1px 8px rgba(0,0,0,0.06);
        border: none;
        margin-bottom: 1.5rem;
        max-width: 900px;
        margin-left: auto;
        margin-right: auto;
    }
    .ipgo-add-btn {
        display: flex;
        justify-content: flex-end;
        max-width: 900px;
        margin: 0 auto 1.5rem auto;
    }
</style>
</head>
<body>
		<jsp:include page="../../layout/header.jsp"/>

	<div class="alert alert-success list" style="width: 800px;">
		<b>총 ${totalCount }개의 상품이 입고 중입니다</b>
	</div>
	<div class="ipgo-add-btn">
		<button type="button" class="btn btn-ipgo" onclick="location.href='form'">
			<i class="bi bi-plus-circle"></i> 등록
		</button>
	</div>
	<div class="ipgo-card-list">
		<C:forEach var="dto" items="${list }">
			<div class="ipgo-card">
				<C:if test="${dto.photoname!='no' }">
					<C:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
						<img alt="" src="../save/${pn }">
					</C:forTokens>
				</C:if>
				<div class="ipgo-title">${dto.sangpum }</div>
				<div class="ipgo-price">가격 : ${dto.price }</div>
				<div class="ipgo-date">입고일 : <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></div>
				<div class="ipgo-btns">
					<button class="btn btn-ipgo btn-sm">수정</button>
					<button class="btn btn-ipgo btn-sm">삭제</button>
				</div>
			</div>
		</C:forEach>
	</div>
</body>
</html>