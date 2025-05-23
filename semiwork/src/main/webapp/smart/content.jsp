<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.smartDto"%>
<%@page import="data.dao.smartDao"%>
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
<style type="text/css">
	img{
	width: 200px;
	}
</style>
<script type="text/javascript">
	$(function(){
		list();
		
		//댓글 부분 ajax insert
		var num=$("#num").val();
		//alert(num);
		$("#btnsend").click(function(){
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			$.ajax({
				type:"get",
				url:"smart/insertanswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					alert("성공");
					
					//초기화
					$("#nickname").val('');
					$("#content").val('');
					list();
				}
			});
		});
			
	});
	/* 호출해야될 일이 많은 함수 : 따로 정의 */
	function list() {

		  console.log("list num="+$("#num").val());
		  
		  $.ajax({
			  
			  type:"get",
			  url:"smart/listanswer.jsp",
			  dataType:"json",
			  data:{"num":$("#num").val()},
			  success:function(res){
				  
				  //댓글갯수출력
				  $("b.acount>span").text(res.length);
				  
				  var s="";
				  $.each(res,function(idx,item){
					  s+="<div>"+item.nick+":   "+item.content;
					  s+="<span class='aday'>"+item.writeday+"</span>";
					  s+="<button type='button' class='btn btn-danger btn-sm'>삭제</button>";
					  s+="</div>";
				  });
				  
				  $("div.alist").html(s);
				  
			  }
		  });
		  
	}
</script>
</head>
<%
		String num=request.getParameter("num");
		smartDao dao=new smartDao();
		
		//dto
		smartDto dto=dao.getData(num);
		//조회수
		dao.updateReadCount(num);
		//날짜 포맷
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
<body>
	<div class="content">
	<input type="hidden" id="num" value="<%=num%>">
		<table class="table table-bordered" style="width: 700px;">
			<tr>
				<td>
					<h3><%=dto.getSubject() %></h3>
					<br>
					<b><%=dto.getWriter() %></b>
					<span style="color: gray;"><%=sdf.format(dto.getWriteday()) %></span>
					<span >조회:<%=dto.getReadcount() %></span>
				</td>
			</tr>
			<tr height="200px;">
				<td><%=dto.getContent() %></td>
			</tr>
			
			 <!-- 댓글 -->
       <tr>
         <td>
           <b class="acount" id="alist">댓글  <span>0</span></b>
           <div class="alist">
              댓글목록
           </div>
           <div class="aform input-group">
              <input type="text" id="nickname" class="form-control"
              style="width: 100px;" placeholder="닉네임">&nbsp;&nbsp;
              <input type="text" id="content" class="form-control"
              style="width: 300px;" placeholder="댓글입력">&nbsp;&nbsp;
              <button type="button" id="btnsend" class="btn btn-success">저장</button>
           </div>
         </td>
       </tr>
			
			<tr>
				<td>
					<button type="button" class="btn btn-warning"
					onclick="location.href=''" style="width: 80px;">글쓰기
					</button>
					<button type="button" class="btn btn-warning"
					onclick="location.href=''" style="width: 80px;">수정
					</button>
					<button type="button" class="btn btn-warning"
					onclick="location.href=''" style="width: 80px;">삭제
					</button>
					<button type="button" class="btn btn-warning"
					onclick="location.href='index.jsp?main=smart/selist.jsp'" style="width: 80px;">목록
					</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>