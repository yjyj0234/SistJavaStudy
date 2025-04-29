<%@page import="gaip.GaipDao"%>
<%@page import="gaip.GaipDto"%>
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
	
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		
		//hp는 3개 합쳐야함
		String hp=request.getParameter("hp1")+"-"
					+request.getParameter("hp2")+"-"+request.getParameter("hp3");
		
		//lang은 배열형태(여러개 선택 가능하니까)로 선언,  Parametervalues로
		//lang 값 불러오기
		String[] lang=request.getParameterValues("lang1");
		String my="";
		if(lang==null){
			my="no";
		}else{
			for(int i=0;i<lang.length;i++){
				my+=lang[i]+",";
			}
			my=my.substring(0,my.length()-1);   //마지막 콤마 제거
		}
			 		
		String birth=request.getParameter("birth");
		
		//dto에 값을 넣어 
			GaipDto dto=new GaipDto();
			dto.setName(name);
			dto.setAge(age);
			dto.setHp(hp);
			dto.setLang(my);
			dto.setBirth(birth);
			
		//insert 메서드에 호출
			GaipDao dao=new GaipDao();
			dao.insertGaip(dto);
		//목록으로 이동
			response.sendRedirect("gaipList.jsp");
	%>
	
</body>
</html>