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
	.lists{
		margin: 0 auto;
	}
    /* 현대적 다크 테이블 스타일 */
    .table.lists {
        background: #232323;
        border-radius: 14px 14px 0 0;
        overflow: hidden;
        box-shadow: 0 2px 16px rgba(0,0,0,0.10);
    }
    .table th {
        background: #181818;
        color: #fff;
        border-bottom: 2px solid #333;
        font-weight: 700;
        letter-spacing: 0.5px;
    }
    .table td {
        background: #232323;
        color: #f5f5f5;
        border-color: #333;
        vertical-align: middle;
    }
    .table tr {
        transition: background 0.18s;
    }
    .table tr:hover {
        background: #292929;
    }
    /* 페이지네이션 다크 스타일 */
    .pagination {
        --bs-pagination-bg: #232323;
        --bs-pagination-color: #fff;
        --bs-pagination-border-color: #444;
        --bs-pagination-hover-bg: #fff;
        --bs-pagination-hover-color: #181818;
        --bs-pagination-active-bg: #fff;
        --bs-pagination-active-color: #181818;
        --bs-pagination-active-border-color: #fff;
    }
    .page-link {
        background: #232323;
        color: #fff;
        border: 1px solid #444;
        border-radius: 8px !important;
        margin: 0 2px;
        box-shadow: 0 1px 4px rgba(0,0,0,0.08);
        transition: background 0.18s, color 0.18s, box-shadow 0.18s;
    }
    .page-link:hover, .page-item.active .page-link {
        background: #fff;
        color: #181818;
        border-color: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.12);
    }
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../../layout/header.jsp"/>
	
	<C:if test="${sessionScope.loginok!=null }">
	<button type="button" class="btn btn-outline-success"
	onclick="location.href='writeform'">글쓰기</button>
	</C:if>
	<br><br>
	<table class="table table-bordered lists" style="width: 1000px;">
		<tr>
			<th width="80">번호</th>
			<th width="400">제목</th>
			<th width="120">작성자</th>
			<th width="80">조회</th>
			<th width="280">등록일</th>
		</tr>
		<C:if test="${totalCount==0 }">
		<tr>
			<td colspan="5" align="center">
				<b>등록된글 없음!!!!!!!!!!!</b>
			</td>
		</tr>
		</C:if>
		
		<C:if test="${totalCount>0 }">
		<C:forEach var="dto" items="${list}">
				<tr>
					<td align="center">${no }</td>
					<C:set var="no" value="${no-1 }"></C:set>
					<td>${dto.subject }
					<C:if test="${dto.uploadfile!='no' }">
						<i class="bi bi-highlights" style="color: gray;"></i>
					</C:if>
					</td>
					<td>${dto.name }</td>
					<td>${dto.readcount }</td>
					<td>
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
			</C:forEach>
		</C:if>
	</table>
	<!--페이지 번호 출력  -->
     <div style="margin: auto;" >
     <ul class="pagination justify-content-center" style="gap: 0px">
       <C:if test="${startPage>1 }">
       		 	  <li class="page-item">
        	    <a class="page-link" href="list?currentPage=${startPage-1 }"
        	    style="color: black;">
        	      이전
        	    </a>
        	  </li>
       </C:if>
         <C:forEach var="pp" begin="${startPage }" end="${endPage }">
       		<C:if test="${pp == currentPage }">
					<li class="page-item active">
					<a class="page-link"
						href="list?currentPage=${pp }">${pp }
						</a>
					</li>
				</C:if>
       		<C:if test="${pp!=currentPage }">
       			<li class="page-item">
       				  <a class="page-link" href="list?currentPage=${pp }">${pp }</a>
       				</li>	
       		</C:if>
       </C:forEach>
          
			<!-- 다음 -->
		<C:if test="${endPage<totalPage }">
				<li class="page-item">
        	    <a class="page-link" href="list?currentPage=${endPage+1 }"
        	    style="color: black;">
        	      다음
        	    </a>
        	  </li>
		</C:if>       		
     </ul>
     </div>
     </div>
</body>
</html>