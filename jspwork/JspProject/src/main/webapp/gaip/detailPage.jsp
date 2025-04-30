<%@page import="gaip.GaipDao"%>
<%@page import="gaip.GaipDto"%>
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
<%

GaipDao dao=new GaipDao();
String num=request.getParameter("num");
GaipDto dto= dao.getData(num);


%>
<script>

	function deletemsg(num){
		var msg=confirm("메세지를 삭제합니다");
		if(msg){
			location.href="delete.jsp?num="+num;
			
		}
		//else굳이 없어도 됨(detailpage 그대로 있으면 되서)
		<%-- else{
			location.href="detailPage.jsp?num="+<%=dto.getNum()%>;
		} --%>
		
	}
</script>	
</head>
<body>





	<div style="margin:100px 100px; width:600px;">
	
	<form action="addAction.jsp" method="post" name="frm">
		<table class="table table-bordered">
			<tr>
				<th colspan="2" style="text-align:center; background-color:gold;"><%=dto.getName()%>님의 가입 정보</th>
				
			</tr>
			<tr>
				<th>연령대</th>
				<td>
					<%=dto.getAge() %>대
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<%=dto.getHp() %>
				</td>
			</tr>
			<tr>
				<th>가능한 언어</th>
				<td>
					<%=dto.getLang().equals("no")?"가능 언어 없음":dto.getLang() %>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<%=dto.getBirth().substring(0,10) %>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="btn btn-success" value="수정" onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'">
					<input type="button" class="btn btn-danger" value="삭제" onclick="deletemsg(<%=num%>)">
					<input type="button" class="btn btn-info" value="목록" onclick="location.href='gaipList.jsp'">
				</td>
			</tr>
		</table>	
		
			
	</form>
	</div>
</body>
</html>