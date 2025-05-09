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
		UploadDto dto=new UploadDto();
		
		//dto 수정
	
		
		//업로드
		ServletContext context=getServletContext();
		String realFolder=context.getRealPath("/save");
		System.out.println("업로드 경로:"+realFolder);
		int filesize=1024*1024*5;
		
		//멀티파트 생성
		MultipartRequest multi=null;
		try{
			//생성자 파라미터
			//request, 업로드폴더, 업로드사이즈,한글타입,
			//같은 이름일 경우 뒤에 숫자 붙임
			multi=new MultipartRequest(request,realFolder,filesize,"utf-8",new DefaultFileRenamePolicy());
			
			//입력값읽기
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String pass=multi.getParameter("pass");
			
			//실제 업로드 이미지 이름 읽어오기
			String imgname=multi.getFilesystemName("photo");
			
			//dto에담기
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPass(pass);
			dto.setImgname(imgname);
			
			dao.insertBoard(dto);
			
			response.sendRedirect("boardList.jsp");
		}catch(Exception e){
			
		}
		//dao insert메서드에 dto값 넣기
		
	%>
</body>
</html>