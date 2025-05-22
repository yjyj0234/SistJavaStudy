<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.boardDto"%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
	<%
		String num=request.getParameter("num");
		boardDao dao=new boardDao();
		boardDto dto=dao.getData(num);
		String pass=request.getParameter("pass");
		//조회수 증가
		dao.updateReadCount(num);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
<body>
	<div class="boardcontent">
		<table class="table table-bordered" style="width: 700px;">
			<caption align="top"><b>내용확인</b></caption>
			<tr>
				<td>
					<b style="font-size: 1.3em;"><%=dto.getSubject() %></b>
					<br>
					<b><%=dto.getWriter() %></b>
					<span style="color: gray;"><%=sdf.format(dto.getWriteday()) %></span>
					<span>조회 <%=dto.getReadcount() %></span>
				</td>
			</tr>
			<tr height="150">
				<td>
						<%=dto.getContent().replace("\n", "<br>") %>
					<!-- 버튼들 -->
				</td>
			</tr>
			<tr>	
				<td>
					<div class="buttons" style="float: right; vertical-align: bottom;">
						<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='index.jsp?main=board/writeform.jsp'">글쓰기</button> 
					    <button type="button" class="btn btn-outline-success"
              onclick="location.href='index.jsp?main=board/writeform.jsp?num=<%=num%>&regroup=<%=dto.getRegroup()%>&restep=<%=dto.getRestep()%>&relevel=<%=dto.getRelevel()%>'">답글</button>

						<button type="button" class="btn btn-outline-secondary"
						onclick="location.href=''">수정</button>
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
  							삭제
						</button>
						<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='index.jsp?main=board/boardlist.jsp'">목록</button>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<!-- 비밀번호 입력 후 확인 버튼 누르면 
	deletepassaction 에서 비밀번호 맞으면 boardlist로 이동 -->
	

<!-- Modal -->
<form action="board/deletepassaction.jsp">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
         
       <span style="color: darkred"><h2 class="modal-title" id="exampleModalLabel">
       !삭제 전 확인</h2></span>
       
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <span style="float: left;">비밀번호 입력</span><br>
        <input type="hidden" name="num" value="<%=num%>">
        <input type="password" name="pass" 
        class="form-control" style="width: 200px;">
	
      </div>
      
      <div class="modal-footer">
        
        <button type="submit" class="btn btn-danger">
        삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</form>
</body>
</html>