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
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td align="top">
			<h3>${dto.subject }</h3>
			<br>
			<span style="float: right;">
				<b>${dto.writer }</b>
			</span><br>
			<span style="float: right; color: gray;">
			조회  ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd hh:mm"/>
			</span>
			
			</td>
		</tr>
		<tr>
			<td>
			<div style="text-align: right;">
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="pho" items="${dto.photo }" delims=",">
					<!-- 다운로드 컨트롤러 -->
						<a href="../board/download?clip=${pho }">
							<i class="bi bi-download"></i>
							<span>${pho }</span>
						</a><br>
					</c:forTokens>
				</c:if>
			</div>
				<pre style="text-align: left;">${dto.content }
				</pre>
				<c:if test="${dto.photo!=no }">
			<c:forTokens var="im" items="${dto.photo }" delims=",">
				<a href="../photo${im }"><img src="../photo/${im }"
				style="width: 200px; height: 200px;"> </a>
			</c:forTokens>
		</c:if>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<div id="answer" style="float: left;">댓글목록</div><br>
					
					<form action="ainsert" method="post">
				<!-- foreign key로 설정한 num값 가져오기 -->
						<input type="hidden" value="${dto.num }" name="num">
						<input type="hidden" value="${currentPage }" name="currentPage">
						<div >
						<c:forEach var="adto" items="${alist }">
						<div class="input-group" >
							<b style="float: left;">${adto.nickname }</b>&nbsp;&nbsp;
							${adto.content }
							</div>
						<div style="float: right;">
						<fmt:formatDate value="${adto.writeday }" pattern="yyyy-MM-dd hh:mm"/>
						<button type="button" class="btn btn-warning btn-sm">수정</button>
						<button type="button" class="btn btn-danger btn-sm">삭제</button>
						</div>
						</c:forEach>
						
					</div>
					<br><br>
						<div class="input-group" style="text-align: left;">
							<b>닉네임</b>&nbsp;
							<input type="text" name="nickname" class="form-control"
							style="width: 100px;" required="required" placeholder="닉네임">
							&nbsp;&nbsp;&nbsp;
							<b>비밀번호&nbsp;</b>
							 <input type="password" name="pass" class="form-control"
							style="width: 80px;" required="required" placeholder="비밀번호"><br>
						</div>
						
						<br>
						<div class="input-group">
							<input type="text" name="content" class="form-control"
						style="width: 500px; height: 120px;" required="required" placeholder="댓글내용입력">
						
						<button type="submit" class="btn btn-success">확인</button>
						</div>
						
					</form>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<button type="button" class="btn btn-outline-warning"
				onclick="location.href='form'">글쓰기</button>
					<button type="button" class="btn btn-outline-info"
				onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currnetPage }'">
				답글쓰기</button>
					<button type="button" class="btn btn-outline-dark"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button type="button" class="btn btn-outline-danger"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					<button type="button" class="btn btn-outline-secondary"
				onclick="location.href='list'">목록</button>
			</td>
		</tr>
		
	</table>
</body>
</html>