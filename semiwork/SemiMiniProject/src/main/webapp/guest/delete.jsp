<%@page import="data.dto.guestDto"%>
<%@page import="data.dao.guestDao"%>
<%@page import="java.io.File"%>

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
		String num=request.getParameter("num");
		String sessionid=(String)session.getAttribute("mid");	
	
		guestDao dao=new guestDao();
		guestDto dto=dao.getData(num);
		
		
		String imgName=dao.getData(num).getPhoto();
		String uploadPath=getServletContext().getRealPath("/save");
		
		//파일생성
		File file=new File(uploadPath+"/"+imgName);
		if(sessionid==null|| !sessionid.equals(dto.getMyid())){%>
					<script type="text/javascript">
						alert("삭제권한이 없습니다");
						history.back();
					</script>				
		<%}else{
			dao.deleteGuest(num);
			if(file.exists()){
				System.out.println(file);
				file.delete();
			}
			%>
				<script type="text/javascript">
					alert("삭제되었습니다");
					location.href="guestlist.jsp";
				</script>
				
							
			<%}
		
			
	%>
			
		
	</script>
	
</body>
</html>