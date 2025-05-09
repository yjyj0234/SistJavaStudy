<%@page import="java.io.File"%>
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
		//num,pass 읽기
		String num=request.getParameter("num");
		String pass=request.getParameter("pass");
		
		UploadDao dao=new UploadDao();
		
		//메서드 isEqualPass 반환값 b받기
		
		boolean b=dao.isEqualPass(num, pass);
		
		if(b){
			//db 삭제 전 save폴더 업로드 이미지 지우기
			String imgname=dao.getData(num).getImgname();
			//파일 업로드경로
			String uploadPath=getServletContext().getRealPath("/save");
			
			//파일생성
			File file=new File(uploadPath+"/"+imgname);
			
			//파일 삭제
			//파일이 존재하면 지운다
			if(file.exists()){  
				file.delete();
			}
			
			dao.deleteUpload(num);
			response.sendRedirect("boardList.jsp");
		}else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
		
		<%}
	%>
</body>
</html>