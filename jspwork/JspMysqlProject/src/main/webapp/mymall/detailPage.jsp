<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mymall.MymallDto"%>
<%@page import="mymall.MymallDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	function funDel(){
		var c=confirm("삭제하시겠습니까?");
		if(c){
			location.href("delete.jsp?num="<%=%>);	
		}
	}
</script>
</head>
<body>
<%
	String num=request.getParameter("num");
	MymallDao dao=new MymallDao();
	MymallDto dto=dao.getOneDetails(num);
	NumberFormat nf=NumberFormat.getCurrencyInstance();
	
%>
<div style="margin:100px 100px; width:800px;">
<h3 class="bg-primary text-white p-1 rounded" ><%=dto.getNum() %>번 상품 정보</h3>
	<table class="table table-bordered">
		<tr>
			<th width="150" class="table-primary">상품명</th>
			<td><%=dto.getSangpum() %></td>
			<td rowspan="4" style="text-align:right; width:200px;" ><img src="../image/쇼핑몰사진/<%=dto.getPhoto() %>.jpg" width="200" height="250" > </td>
		</tr>
		<tr>
			<th width="150" class="table-primary">색상</th>
			<td><%=dto.getColor() %> <div style="background-color:<%=dto.getColor() %>; width:100px;" >색상</div></td>
		</tr>
		<tr>
			<th width="150" class="table-primary">가격</th>
			<td><%=dto.getPrice() %>원</td>
		</tr>
		<tr>
			<th width="150" class="table-primary">입고 날짜</th>
			<td><%=dto.getIpgoday() %></td>
		</tr>
		
	</table>
	<button type="button" class="btn btn-warning">수정</button>
	<button type="button" class="btn btn-danger" onclick="funDel()">삭제</button>
	<button type="button" class="btn btn-secondary" onclick="location.href='mallList.jsp'">목록</button>
</div>

</body>
</html>