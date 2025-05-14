<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hoewon.hoewonDto"%>
<%@page import="hoewon.hoewonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<style type="text/css">
	th{
		
	}
</style>
<title>Insert title here</title>
</head>
<%
	hoewonDao dao=new hoewonDao();
	List<hoewonDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(list.size());
%>
<script type="text/javascript">
	
</script>
<body>
	<!-- 번호(일련번호)    회원명    비밀번호     아이디    가입날자    수정/삭제-->
	<div style="margin: 100px 100px; width: 650px">
	<button type="button" class="btn btn-success" onclick="location.href='../hlog/loginForm.jsp'" style="margin-left: 400px;">Login</button>
	
		<table class="table table-bordered" >
			<tr >
				<th class="bg-info" style="width: 50px;">번호</th>
				<th class="bg-secondary">회원명</th>
				<th class="bg-info">비밀번호</th>
				<th class="bg-info">아이디</th>
				<th class="bg-info">가입날짜</th>
				<th class="bg-info">관리</th>
			</tr>
			<%
			
				for(int i=0;i<list.size();i++){
					hoewonDto dto=list.get(i);
					%>
					<tr>
					<td><%=dto.getNum() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getPass() %></td>
					<td><%=dto.getMid() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td align="center">
						<button type="button" class="btn btn-danger btn-sm" 
						onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">강퇴</button>
					</td>
					</tr>
				<%}
			%>
			
		</table>
	</div>
</body>
</html>