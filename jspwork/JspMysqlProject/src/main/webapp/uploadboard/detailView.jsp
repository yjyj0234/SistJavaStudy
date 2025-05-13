<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<title>Insert title here</title>
<style type="text/css">
  div.alist span.aday{
    float: right;
    font-size: 0.8em;
    color: #bbb;
  }
  i.del{
  	cursor: pointer;
  }
  i.update{
  	cursor: pointer;
  }
</style>
</head>
<script type="text/javascript">
$(function(){
	  
	  //처음시작시 댓글목록 호출
	  list();
	  
	  //insert
	  var num=$("#num").val();
	  console.log(num);
	  
	  $("#btnSend").click(function(){
		  
		  var nickname=$("#nickname").val().trim();
		  var content=$("#content").val().trim();
		  
		  if(nickname==''){
			  alert('닉네임을 입력후 저장해주세요');
			  return;
		  }
		  if(content==''){
			  alert('댓글내용을 입력후 저장해주세요');
			  return;
		  }
		  
		  //ajax로 insert해보기
		  $.ajax({
			  
			  type:"get",
			  url:"../uploadboard/insertAnswer.jsp",
			  dataType:"html",
			  data:{"num":num,"nickname":nickname,"content":content},
			  success:function(){
				 // alert("insert_success");
				 //기존입력값 지우기
				 $("#nickname").val('');
				 $("#content").val('');
				 
				 //list호출
				 list();
			  },
			  statusCode:{
				  404:function(){
					  alert("파일이 없다");
				  },
				  500:function(){
					  alert("서버오류..코드 다시한번 볼것!!!")
				  }
			  }
		  });
		  
		  
	  });
	  //삭제버튼
	$(document).on("click","i.del",function(){
		var c=confirm("댓글 삭제");
		//idx값 불러오기
			var idx=$(this).attr("idx");
		
		//alert(idx);
		if(c){
			$.ajax({
				type:"get",
				url:"../uploadboard/deleteAnswer.jsp",
				dataType:"html",
				data:{"idx":idx},
				success:function(){
					alert("삭제하였습니다");
					list();
				},
				statusCode:{
					404:function(){
						alert("파일이 없습니다");
						
					},
					500:function(){
						alert("서버오류...코드 다시 볼것");
					}
				}
			})
		}
		
	});
	  
	  //댓글버튼 누르면 댓글창 보이게
	  $("b.acount").click(function(){
		  $("div.aupdateform").hide();
		  $("div.aform").toggle();
	  })
	  
	  //수정창 안보이게
	  $("div.aupdateform").hide();
	//수정버튼 누르면 수정폼 뜨게
	/* icon이라서 이렇게 클릭이벤트 만들어야함 */
	$(document).on("click","i.update",function(){
		$("div.aform").hide();
		$("div.aupdateform").show();
		var idx=$(this).attr("idx");
		console.log(idx);
		
		$("#idx").val(idx);
		$.ajax({
			type:"get",
			url:"../uploadboard/dtoAnswer.jsp",
			dataType:"json",
			data:{"idx":idx},
			success:function(res){
				$("#idx").val(res.idx);
				$("#unickname").val(res.nick);
				$("#ucontent").val(res.content);
			}
		})
		
	});
	
	//수정
	$("#btnUSend").click(function(){
		var idx=$("#idx").val();
		var nick=$("#unickname").val();
		var content=$("#ucontent").val();
		//alert(nick+","+content);
		$.ajax({
			type:"post",
			url:"../uploadboard/updateAnswer.jsp",
			dataType:"html",
			data:{"idx":idx,"nickname":nick,"content":content},
			success:function(){
				list();
				$("div.aupdateform").hide();
				$("div.aform").show();
				
			}
		});
	});
});

function list()
{
	  //댓글출력
	  console.log("list num="+$("#num").val());
	  
	  $.ajax({
		  
		  type:"get",
		  url:"../uploadboard/listAnswer.jsp",
		  dataType:"json",
		  data:{"num":$("#num").val()},
		  success:function(res){
			  
			 //댓글갯수 출력
			  $("b.acount>span").text(res.length);
			 
			 var s="";
			 $.each(res,function(idx,item){
				 
				 s+="<div>"+item.nickname+": "+item.content;
				 s+="<span class='aday'>"+item.writeday+"</span>&nbsp;&nbsp;&nbsp;&nbsp;";
				 s+="<i class='bi bi-trash del' idx="+item.idx+"></i>";
				 s+="<i class='bi bi-pencil-square update' idx="+item.idx+"></i>";
				 s+="</div>";
			 });
			 
			 $("div.alist").html(s);
		  }
	  });
}
</script>
<body>
	<%
	String num=request.getParameter("num");

		UploadDao dao=new UploadDao();
		UploadDto dto=dao.getData(num);
		dao.updateReadCount(num);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//현재페이지 번호
		String currentPage=request.getParameter("currentPage");
	%>
	<input type="hidden" id="num" value="<%=num%>">
	<!--제목 작성자 작성일 조회수  이미지  내용
  글쓰기,수정,삭제,목록 버튼 -->
		<div style="margin:100px 100px; width:650px;">
			<table class="table table-bordered">
				<th><h2><%=dto.getSubject() %></h2></th>
				<tr >
					<td style="text-align: left; font-size: 14px;"><%=dto.getWriter() %><br>
					<span style="text-align: left; color:gray; font-size: 11px;"><%=sdf.format(dto.getWriteday()) %></span>
					<span style="text-align: left; color:gray; font-size: 11px;">&nbsp;조회수&nbsp; <%=dto.getReadcount() %></span>
					</td>
					
				</tr>
				<tr>
					<td style="padding-left: 50px;">
					<!-- content 안에 있는 줄바꿈을 HTML에서 화면에 줄바꿈을 적용하도록 <br> 태그로 변환 -->
						<%=dto.getContent().replace("\n", "<br>") %>
						<br><br>
						<!-- 이미지 누르면 원래 사이즈 -->
						<a href="../save/<%=dto.getImgname()%>">
							<img alt="" src="../save/<%=dto.getImgname()%>" style="max-width:200px;">
						</a>
					</td>
				</tr>
				
				<!-- 댓글 -->
				<tr>
					<td>
						<b class="acount">댓글<span>0</span></b>
						<div class="alist">댓글목록
						</div>
						<!-- 입력폼 -->
						<div class="aform input-group">
							<input type="text" id="nickname" class="form-control"
							style="width:80px;" placeholder="닉네임">
							<input type="text" id="content" class="form-control"
							style="width:300px; margin-left:10px;" placeholder="댓글메세지">
							<button type="button" id="btnSend" class="btn btn-info btn-sm" style="margin-left:10px;">저장</button>								
						</div>
						<!-- 수정폼(닉 메세지,저장 id수정) -->
						<div class="aupdateform input-group">
						<input type="hidden" id="idx">
							<input type="text" id="unickname" class="form-control"
							style="width:80px;" placeholder="수정닉네임">
							<input type="text" id="ucontent" class="form-control"
							style="width:300px; margin-left:10px;" placeholder="수정메세지">
							<button type="button" id="btnUSend" class="btn btn-info btn-sm" style="margin-left:10px;">수정</button>								
						</div>
					</td>
				</tr>
				
				
				<tr>
					<td align="right">
						<button type="button" class="btn btn-outline-success" onclick="location.href='addForm.jsp'">글쓰기</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">수정</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">삭제</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='boardList.jsp?currentPage=<%=currentPage%>'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	
</body>
</html>