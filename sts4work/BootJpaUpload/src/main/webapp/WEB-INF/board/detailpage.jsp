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
<div style="margin: 100px 100px; width: 500px;">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td style="text-align: center;" colspan="2">
				<span style="font-size: 22px;"><b>${dto.subject }</b></span>
					<br>
					<span style="float: right;">
					<b>${dto.writer }</b><br>
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</span>
				</td>
			</tr>
			
			<tr>
				
				<td >
					${dto.content }<br>
					<img alt="" src="../save/${dto.photo }" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
				<button type="button" class="btn btn-outline-dark" 
				onclick="location.href='form'">글쓰기</button>
					<button type="button" class="btn btn-outline-dark" 
					onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger" 
					onclick="remove('${dto.num}')">삭제</button>
					<button type="button" class="btn btn-outline-info" 
					onclick="location.href='list'" >목록</button>
				</td>
			</tr>
		</table>
</div>
<script type="text/javascript">
	function remove(num){
		/* alert(num); */
		var ans=confirm("삭제하려면 [확인]을 눌러주세요");
		if(ans){
			location.href="delete?num="+num;
			alert("삭제되었습니다");
		}
	}
</script>
</body>
</html>