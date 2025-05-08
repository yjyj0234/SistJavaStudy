<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		ServletContext context=getServletContext();
		String realFolder=context.getRealPath("/save");
		
		System.out.println(realFolder);
		int filesize=1024*1024*5;   //5mb
		
		//멀티 파트 생성
		MultipartRequest multi=null;
		
		//무조건 try~catch 기본으로 해줘야함
		try{
			//같은 파일 업로드할 때 new DefaultFileRenamePolicy()) 로 뒤에 숫자 붙는 기능
			multi= new MultipartRequest(request,realFolder,filesize,"utf-8",new DefaultFileRenamePolicy());
			String name=multi.getParameter("name");
			String title=multi.getParameter("subject");
			//실제 업로드된 파일명
			String uploadFile=multi.getFilesystemName("uploadfile");
			String originalName=multi.getOriginalFileName("uploadfile");
			%>
			
			<div>
				<h3>이름: <%=name %></h3>
				<h5>제목: <%=title %></h5>
				<img alt="" src="../save/<%=uploadFile%>">
				<h5>원래파일명: <%=originalName %></h5>
				<button type="button" onclick="location.href='uploadForm.jsp'">다시업로드</button>
			</div>
			
		<%}catch(Exception e){
			
		}
	
	%>
</body>
</html>