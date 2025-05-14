<%@page import="hoewon.hoewonDao"%>
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
		//mid,pass,remember
		String id=request.getParameter("mid");
		String pass=request.getParameter("pass");
		String saveid=request.getParameter("remember");  //체크안하면 null 로
		
		//dao의 로그인 호출
		//1일 경우(맞는 경우) 세션 저장 후 메인으로 가기
		//2일 경우 '비밀번호가 맞지 않습니다' 이전페이지로
		//3일 경우 '가입되지 않은 아이디입니다' 이전페이지
		hoewonDao dao=new hoewonDao();
		int idx=dao.getLogin(id, pass);
				if(idx==1){
					//session에 저장
					session.setAttribute("loginok","yes");
					session.setAttribute("mid", id);
					session.setAttribute("saveid", saveid==null?"no":"yes");
					
					session.setMaxInactiveInterval(60*60*8); //8시간 유지
					
					response.sendRedirect("loginMain.jsp");
				}else if(idx==2){%>
					<script type="text/javascript">
					 alert("비밀번호가 맞지 않습니다");
					 history.back();
					</script>					
				<%}else if(idx==3){%>
						<script type="text/javascript">
						alert("가입되지 않은 회원입니다");
						history.back();
						</script>						
				<%}
		
		
	%>
</body>
</html>