<%@page import="data.dao.boardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
	<%
		//답글일 경우 읽어야할 값 처리
		String num=request.getParameter("num");
		
		//새글일 경우 null, 답글은 원글의 num이 넘어오는 것
		String regroup="",relevel="",restep="",subject="";
		
		//db선언
		boardDao dao=new boardDao();
		
		//답글인 경우 제목에 원글 제목
		if(num!=null){
    	regroup=request.getParameter("regroup");
    	relevel=request.getParameter("relevel");
    	restep=request.getParameter("restep");
    	
    	//답글일경우 제목부분에 원글제목
    	subject="[답글]"+dao.getData(num).getSubject();
   	    } 
 	%>
 	
<body>
	<div>
		<form action="board/writeaction.jsp" method="post">
	
			<!-- hidden -->
			<%
			//답글일때만 hidden 으로 넘긴다
				if(num!=null){%>
					<input type="hidden" name="num" value="<%=num%>">
					<input type="hidden" name="regroup" value="<%=regroup%>">
					<input type="hidden" name="restep" value="<%=restep%>">
					<input type="hidden" name="relevel" value="<%=relevel%>"> 
				<%}
			
			%>
			<table class="table table-bordered" style="width: 500px;">
				<caption align="top"><b><%=num==null?"새글등록":"답글등록" %></b></caption>

				<tr>
					<th class="table-warning">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control"
						style="width: 100px;">
					</td>				
				</tr>
				<tr>
					<th class="table-warning">제목</th>
					<td>
						<input type="text" name="subject" class="form-control"
						style="width: 300px;">
					</td>				
				</tr>
				<tr>
					<td colspan="2">
						<textarea style="width: 480px; height: 150px;" class="form-control"
						name="content" required="required" ></textarea>
					</td>				
				</tr>
				<tr>
					<th class="table-warning">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control"
						style="width: 150px;" required="required">
					</td>				
				</tr>
				<tr>
					<td colspan="2">
					<button type="submit" class="btn btn-success btn-bg">게시글 등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>