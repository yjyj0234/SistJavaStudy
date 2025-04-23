<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hello.HelloDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hello.HelloDao"%>
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
    

</head>
<body>
<%
	HelloDao dao=new HelloDao();
	ArrayList<HelloDto> list=dao.getAllHelloDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<div style="margin:50px 100px;">
	<button type="button" class="btn btn-info btn-sm"
	onclick="location.href='insertForm.jsp'" style="margin-left:800px;">글쓰기</button>
	<table class="table table-bordered" style="width:1000px;">
		<caption align="top"><b>HelloJsp 전체목록 출력</b></caption>
		<tr class="table-warning">
			<th width="80">번호</th>
			<th width="120">이름</th>
			<th width="350">주소</th>
			<th width="200">전화번호</th>
			<th width="200">가입날짜</th>
			<th width="130">편집</th>
		</tr>
	 <%
	 	for(int i=0; i<list.size();i++){
	 		HelloDto dto=list.get(i);
	 		%>
	 		<tr>
	 			<td id="textno"><%=i+1 %></td>
	 			<td><%=dto.getName() %></td>
	 			<td><%=dto.getAddr() %></td>
	 			<td><%=dto.getHp() %></td>
	 			<td><%=sdf.format(dto.getCurdate()) %></td>
	 			<td>
	 				<button type="button" class="btn btn-success btn-sm" onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
	 				<button type="button" class="btn btn-danger btn-sm" data-url="delete.jsp?num=<%=dto.getNum()%>">삭제</button>
	 				
	 				<!-- onclick="location.href='delete.jsp?num=<%=dto.getNum() %>'" -->
	 				
	 			</td>
	 			
	 		</tr>
	 	<%}
	 %>
	</table>
			<script>
	 			//삭제할 때 confirm창 띄우기
						$(".btn-danger").click(function(){
							//한칸더위에서 찾기
							var finalmessage=confirm($(this).parent().parent().find("#textno").text()+"번 글을 삭제합니다.");
							if(finalmessage){
								var deleteUrl=$(this).data("url");
								location.href=deleteUrl;
							}else{
								return false;
							}
						})
				</script>	
</div>
</body>
					
</html>