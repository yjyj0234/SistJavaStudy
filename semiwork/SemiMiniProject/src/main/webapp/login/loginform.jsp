<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<%
	//세션에서 아이디와 체크값 얻기
	String saveok=(String)session.getAttribute("saveok");
	
	//아이디저장에 체크를 눌렀을때만 아이디값 불러오기
	String myid="";
	
	
	if(saveok!=null){
		myid=(String)session.getAttribute("myid");
		
	}
	%>
<body>

<div style="margin:100px 120px; width:700px;">
		<h2 class="alert alert-secondary">회원 로그인</h2>
		<form action="login/loginaction.jsp" method="post">
		<table>
			<tr>
			<td>
			<input type="text" name="id" class="form-control"
			style="width:450px;  margin-right: 20px;" placeholder="아이디" required="required" value="<%=myid %>">
			</td>
			<td rowspan="2">
			<button type="submit" class="btn btn-primary btn-lg" style="width:150px; height: 150px;">로그인</button><br>
			</td>
			</tr>
			<br><br>
			<tr>
			<td>
				<input type="password" name="pass" class="form-control"
				style="width:450px;" placeholder="비밀번호" required="required">
			</td>
			</tr>
		</table>
			
			<input type="checkbox" name="savechk" <%=saveok==null?"":"checked" %>>아이디 저장
		</form>
	</div>
			<img alt="" src="image/쇼핑몰사진/4.jpg" style="position: absolute; top:150px; left: 900px; width: 300px;">
	
</body>
</html>