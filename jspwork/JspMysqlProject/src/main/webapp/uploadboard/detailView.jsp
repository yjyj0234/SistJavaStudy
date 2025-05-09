<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

<title>Insert title here</title>
</head>
<body>
	<%
		UploadDao dao=new UploadDao();
		String num=request.getParameter("num");
		UploadDto dto=dao.getData(num);
		dao.updateReadCount(num);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
		<div style="margin:100px 100px; width:650px;">
			<table class="table table-bordered">
				<th><h2><%=dto.getSubject() %></h2></th>
				<tr >
					<td style="text-align: left; font-size: 14px;"><%=dto.getWriter() %><br>
					<span style="text-align: left; color:gray; font-size: 11px;"><%=sdf.format(dto.getWriteday()) %></span>
					<span style="text-align: left; color:gray; font-size: 11px;">&nbsp;조회수&nbsp; <%=dto.getReadcount() %></span>
					</td>
					
				</tr>
				<tr>
					<td style="padding: 20px 20px;">
					<!-- content 안에 있는 줄바꿈을 HTML에서 화면에 줄바꿈을 적용하도록 <br> 태그로 변환 -->
						<%=dto.getContent().replace("\n", "<br>") %>
						<br><br>
						<!-- 이미지 누르면 원래 사이즈 -->
						<a href="../save/<%=dto.getImgname()%>">
							<img alt="" src="../save/<%=dto.getImgname()%>" style="max-width:200px;">
						</a>
					</td>
				</tr>
				<tr>
					<td align="right">
						<button type="button" class="btn btn-outline-success" onclick="location.href='addForm.jsp'">글쓰기</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardList.jsp'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	
</body>
</html>