<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.memberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.memberDao"%>
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
<body>
	<%
		memberDao dao=new memberDao();
		List<memberDto> list=dao.getAllMembers();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
		String num=request.getParameter("num");
		
	%>
	<div style="margin: 150px 150px; width: 700px;">
		<table class="table table-bordered">
			<%
				for(memberDto dto:list){%>
					<tr>
					        
						<td rowspan="4" style="vertical-align: middle;">
							<img alt="" src="image/logoImg/icon02.png" 
							style="width: 100px; height: 100px; border-radius: 100px;">
						</td>
						<td>회원명:<%=dto.getName() %></td>
						<td rowspan="4" style="vertical-align: middle;">
						<button type="button" class="btn btn-warning btn-sm">수정</button>
						<button type="button" class="btn btn-danger btn-sm" 
						data-bs-toggle="modal" data-bs-target="#delmyModal_<%=dto.getNum()%>">
    					탈퇴
  						</button>
						</td>
					</tr>
					<tr>
						<td>아이디:<%=dto.getId() %></td>
					</tr>
					<tr>
						<td>이메일:<%=dto.getEmail() %></td>
					</tr>
					<tr>
						<td>가입일:<%=sdf.format(dto.getGaipday()) %></td>
					</tr>
					<!-- The Modal -->
		<!-- id가 delmymodal인 모달이 중복=>모달열때 맨처음 발견된 delmymodal만 염
		=>id값 고유하게 지정 -->
<div class="modal" id="delmyModal_<%=dto.getNum()%>">
  <div class="modal-dialog">
    <div class="modal-content">
    <!-- pass도 보내려면 form 태그 action, method="post" 사용-->
    <form action="member/deletemypage.jsp?num=<%=dto.getNum() %>" method="post">
	<input type="hidden" id="num" value="<%=dto.getNum() %>">
      <!-- Modal Header -->
      <div class="modal-header" >
        <h4 class="modal-title"><b style="color:darkred;">!삭제 전 경고</b></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        정말 내 정보를 삭제하시겠습니까?
        <br>
        <span style="color: gray;font-size: 12px;">삭제 전 비밀번호 입력</span>
        <input type="password" name="pass" required="required" placeholder ="비밀번호 입력"
        class="form-control">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      
        <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>
				<%}
			%>
		</table>
	</div>
	



</body>
</html>