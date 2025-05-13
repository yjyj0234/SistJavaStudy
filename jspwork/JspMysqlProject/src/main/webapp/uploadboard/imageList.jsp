<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="uploadboard.UploadDto"%>
<%@page import="uploadboard.UploadDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
	.table-fixed{
		table-layout: fixed;
		width: 100%;
	}
	.table-fixed td{
		width:20%;
		vertical-align:top;
		text-align: center;
		height: 250px;
		padding: 10px;
	}
	.image-wrapper{
		height: 150px;
		overflow: hidden;
	}
	.image-wrapper img {
		max-height: 100%;
		max-width: 100%;
		
		/* 이미지 가로세로 비율 유지한채로 컨테이너 꽉채움,컨테이너 이미지가 크면 잘라내는 기능(크기 비율 제각각인거 보정) */
		object-fit:cover;
	}	
</style>
<title>Insert title here</title>
</head>
<%
	//db선언
	UploadDao dao=new UploadDao();
	// dao 전체리스트를 List로가져오기
	List<UploadDto> list=dao.getAllDatas();
	//날짜형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<form action="" style="margin:100px 100px; width:800px;">
		<b><%=list.size() %>개의 글이 있습니다</b>
		<br>
		<table class="table table-bordered table-fixed">
			<caption align="top"><b>앨범형 목록보기</b>
				<div>
				<button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp'">목록형</button>
				<button type="button" class="btn btn-primary" onclick="location.href='imageList.jsp'">앨범형</button>
			</div>
			</caption>
		<tr>
			
			<%
			
				//i번째 dto얻기
				for(int i=0;i<list.size();i++){
					UploadDto dto=list.get(i);
					%>
				<td >	
				<a href="detailView.jsp?num=<%=dto.getNum()%>">
					<div class="image-wrapper">
					<img alt="" src="../save/<%=dto.getImgname()%>" style="max-width:150px; height: 150px;">
					</div>
					
				</a>
				<br>
				<hr>
				<a href="detailView.jsp?num=<%=dto.getNum()%>" style="text-decoration:none; color:black;" >
					<b><%=dto.getSubject() %></b>
				</a>
				<br>
				 	<span style="font-size: 13px;"><%=dto.getWriter() %></span>
				<br>
				<span style="text-align: left; color:gray; font-size: 10px;"><%=sdf.format(dto.getWriteday()) %></span>
				<span style="text-align: left; color:gray; font-size: 10px;">&nbsp;조회수&nbsp; <%=dto.getReadcount() %></span>
				
				</td>
				
				<%if((i+1)%5==0){%>
					</tr>
					<tr>
				<%}
				}
			%>
			</tr>	
		</table>
		<div style="text-align: right;">
			<button type="button" class="btn btn-outline-success" onclick="location.href='addForm.jsp'">글쓰기</button>
			</div>
			
			
	</form>
</body>
</html>