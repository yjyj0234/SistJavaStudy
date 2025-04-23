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
		String [] imgArr1={"1","3","4","6","7","8","12","5","2"};
		int n=0;
	%>
	<table>
		<!-- 3행3열로 뽑기 -->
		<%
			for(int i=0;i<3;i++){%>
				<tr height="70">
					<%
						for(int j=0;j<3;j++){%>
							<td>
								<img src="../image/연예인사진/<%=imgArr1[n++]%>.jpg" width="150" height="200">
							</td>
						<%}
					%>
				</tr>
			<%}
		%>
	</table>
	<hr>
	<h2>쇼핑몰사진을 4행 5열로 출력해주세요 이미지 20개 출력</h2>
	<%
		int m=1;
	%>
	<table>
		<%
			for(int i=0;i<4;i++){%>
					<tr>
						<%
							for(int j=0;j<5;j++){%>
								<td>
								<img src="../image/쇼핑몰사진/<%=m++%>.jpg" style="width:120px; height:160px;">
								</td>
							<%}
						%>
					</tr>				
			<%}
		%>
	</table>
	<hr>
	<h2>만화이미지 20개 출력</h2>
	<table>
		<%
			int man=0;
		
			for(int i=0;i<4;i++){%>
				<tr>
					<%
						for(int j=0;j<5;j++){
						   man++;
						   
					 	%>
							<td>
								<img src="../image/만화이미지/<%=man<10?"0"+man:man%>.png" style="width:150px;height:150px">
							</td>
						<%}
					%>
				</tr>				
			<%}
		%>
	</table>
</body>
</html>