<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.memberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.memberDao"%>
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
<style type="text/css">
 
</style>
<script type="text/javascript">
	function delfunc(num) {
		var c=confirm("삭제하시겠습니까?");
		if(c){
			location.href="member/memberdelete.jsp?num="+num;
			alert("삭제하였습니다");
			}
		}
</script>
</head>

<%
	memberDao dao=new memberDao();
	List<memberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no=1;
%>

<body>
	<div style="margin: 150px 150px;">
		<table class="table table-bordered">
			<tr>
				<th style="font-size: 10; width: 130px; 
				background-color: darkgray;">번호(일련번호)</th>
				<th style="background-color: darkgray;">이름</th>
				<th style="background-color: darkgray;">아이디</th>
				<th style="background-color: darkgray;">이메일</th>
				<th style="background-color: darkgray;">가입일</th>
				<th style="background-color: darkgray;">비고</th>	
			</tr>
			
			<%
				for(memberDto dto:list){%>
				<tr>
					<td><%=no++ %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getEmail() %></td>
					<td><%=sdf.format(dto.getGaipday())%></td>
					<td>
						<button type="button" class="btn btn-danger btn-sm" 
						onclick="delfunc('<%=dto.getNum()%>')">강퇴</button>
					</td>
				</tr>
				<%}
			%>
			
			
		</table>
	</div>
	
</body>
</html>