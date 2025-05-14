
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
<jsp:useBean id="dao" class="guest.guestDao"/>
<jsp:useBean id="dto" class="guest.guestDto"/>
<title>Insert title here</title>
</head>
<body>
	<%
		//업로드할 save폴더의 실제서버에서의 위치구하기
		String realPath=getServletContext().getRealPath("/save");
		System.out.println(realPath);
		//업로드 크기
		int uploadSize=1024*1024*3;
		
		try{
			MultipartRequest multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
			
			//입력한 데이터 읽기
			String myid=multi.getParameter("myid");
			String photo=multi.getFilesystemName("photo");
			String content=multi.getParameter("content");
			
			dto.setMyid(myid);
			dto.setPhoto(photo==null?"no":photo);
			dto.setContent(content);
			
			dao.insertGuest(dto);
			
			response.sendRedirect("guestlist.jsp");
			
		}catch(Exception e){
			
		}
		
		
		
	%>
</body>
</html>