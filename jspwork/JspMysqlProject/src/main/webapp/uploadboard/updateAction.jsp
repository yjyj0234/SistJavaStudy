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
		request.setCharacterEncoding("utf-8");
		/* 비밀번호 일치하면 수정 후 상세보기
		불일치하면 경고장*/
		UploadDao dao=new UploadDao();
		UploadDto dto=new UploadDto();
		
	ServletContext context=getServletContext();
	String realFolder=context.getRealPath("/save");
	
	System.out.print("이미지 경로:"+realFolder);
	int filesize=1024*1024*5;
	MultipartRequest multi =null;
	
	try{
		multi=new MultipartRequest(request,realFolder,filesize,
				"utf-8",new DefaultFileRenamePolicy());
		String num=multi.getParameter("num");
		String pass=multi.getParameter("pass");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String imgname=multi.getFilesystemName("photo");
		
		if(dao.isEqualPass(num, pass)){
			
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setImgname(imgname);
			dto.setNum(num);
			dto.setPass(pass);
			
			dao.updateUpload(dto);
			response.sendRedirect("detailView.jsp?num="+num);
			
			}else{%>
			<script type="text/javascript">
			alert("비밀번호가 다릅니다.");
			
			history.back();		
			</script>
			<%}
			
			
		}catch(Exception e){
		e.printStackTrace();
		out.println(e.getMessage());
	}
	%>	

</body>
</html>