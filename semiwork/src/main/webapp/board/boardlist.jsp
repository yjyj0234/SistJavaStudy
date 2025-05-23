<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.boardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.boardDao"%>
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
</head>
<%
	//dao
	boardDao dao=new boardDao();
	List<boardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<div class="write">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='index.jsp?main=board/writeform.jsp'">새글쓰기</button>
	</div>
	<div class="board">
		<table class="table table-bordered" style="width: 800px;">
			<caption align="top"><b>댓글(<%=list.size() %>)</b></caption>
			<tr class="table-success">
				<th width="80">번호</th>
				<th width="380">제목</th>
				<th width="120">작성자</th>
				<th width="180">작성일</th>
				<th width="80">조회</th>
			</tr>
			<%
				if(list.size()==0){%>
					<tr>
					<td colspan="5">
						<b>아직 게시글 하나도 없음</b>
					</td>
					</tr>
				<%}else{
					for(int i=0;i<list.size();i++){
					boardDto dto=list.get(i);
					%>
						<tr>
							<td align="center"><%=list.size()-i %></td>
							<td>
								<!-- 답글인 경우 공백_1레벨당 2칸or3칸 -->
								<%
									for(int a=1;a<=dto.getRelevel();a++){%>
										&nbsp;&nbsp;&nbsp;
									<%}
								%>
								<!-- 답글이면 답글 이미지출력 -->
								<%
									if(dto.getRelevel()>0){%>
										<img alt="" src="image/mall/re.png">	
									<%
									//원글이 만약 없는경우
									boolean flag=dao.isGroupStep(dto.getRegroup());
									//답글이 있는 경우
									if(dto.getRestep()>0){
										//원글이 없는경우
										if(!flag) 
										{%>
											<span style="color: red;">[원글이 없는 답글]</span>
										<%}
									}
									
									}
								%>
								<a href="index.jsp?main=board/content.jsp?num=<%=dto.getNum()%>"
								style="text-decoration: none; color: black;">
								<%=dto.getSubject() %>
								</a>
							</td>
							<td><%=dto.getWriter() %></td>
							<td><%=sdf.format(dto.getWriteday()) %></td>
							<td><%=dto.getReadcount() %></td>
						</tr>
					<%}
				}
			%>
		</table>
	</div>
</body>
</html>