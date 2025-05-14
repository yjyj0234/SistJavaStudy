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
<%
//세션에 저장된 id
	String id=(String)session.getAttribute("mid");
//세션에 저장된 아이디저장 체크값
	String saveid=(String)session.getAttribute("saveid");
//아이디 저장을 체크했을경우 true ,안하면 false
	boolean b;
//no라고 저장=null
	if(saveid==null||saveid.equals("no")){
		b=false;	
	}
	
	else{
		b=true;
	}
		
%>
<body>
	<div class="container mt-3">
  <h2>로그인 창</h2>
  <form action="loginproc.jsp" method="post">
    <div class="mb-3 mt-3">
      <label for="mid">아이디:</label>
      <input type="type" class="form-control" id="mid" placeholder="아이디" name="mid"
      value="<%=b?id:""%>">
      <!-- b가 true면 id가 남아있고 아니면 비워둠 -->
    </div>
    <div class="mb-3">
      <label for="pass">비밀번호:</label>
      <input type="password" class="form-control" id="pass" placeholder="비밀번호" name="pass">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" 
        <%=b?"checked":"" %>> 아이디 기억하기
       <!-- b가 true면 체크가 되어있음 -->
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
	
</body>
</html>