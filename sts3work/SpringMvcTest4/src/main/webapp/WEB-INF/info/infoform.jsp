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
	<form action="write" method="get">
	<table class="table table-bordered" style="width: 500px; margin: 10px 10px;">
	<tr>
		<th>이름</th> 
		<td>
		<input type="text" name="name" width="150">
		</td>
	</tr>
	<tr>
		<th>퍼스널 컬러</th> 
		<td>
		<input type="color" name="color" value="color" width="150">	
		</td>
	</tr>
	 <tr>
		<th>취미</th> 
		<td>
		<input type="checkbox" name="hobby" value="음악감상">음악감상&nbsp;
		<input type="checkbox" name="hobby" value="게임">게임&nbsp;
		<input type="checkbox" name="hobby" value="헬스">헬스&nbsp;
		<input type="checkbox" name="hobby" value="여행">여행&nbsp;
		<input type="checkbox" name="hobby" value="낚시">낚시&nbsp;	
		</td>
	</tr>
	<tr>
		<th>가장 좋아하는 it언어</th>
		<td>
			
			<select name="language">
				<option value="java">Java</option>
				<option value="python">Python</option>
        		<option value="c++">C++</option>
        		<option value="c">C</option>
        		<option value="etc">기타</option>
			</select>
		</td>
	</tr>
	 </table>
	 <button type="submit" class="btn btn-outline-secondary">등록</button>
	</form>
</body>
</html>