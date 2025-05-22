

<%@page import="data.dao.memberDao"%>
<%@page import="data.dto.guestAnswerDto"%>
<%@page import="data.dao.guestAnswerDao"%>
<%@page import="data.dto.guestDto"%>
<%@page import="data.dao.guestDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<title>Insert title here</title>
<style type="text/css">
	i.delete{
		cursor: pointer;
	}
	i.update{
		cursor: pointer;
	}
	i.ansdel,i.aedit{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	
	$(function(){
		//댓글부분 무조건 안보이게	
		$("div.answer").hide();
		//댓글 클릭 시 보였다 안보였다
		$("span.answer").click(function(){
			$(this).parent().find("div.answer").slideToggle();
		});
		$(document).on("click","i.ansdel",function(){
				
			 var a=confirm("삭제하시겠습니까?");
			if(a){
				var idx=$(this).attr("idx");

				$.ajax({
					type:"get",
					url:"guest/answerdelete.jsp",
					dataType:"html",  //void라 html
					data:{"idx":idx},
					success:function(){
						alert("삭제되었습니다");
						location.reload();
					},statusCode:{
						404:function(){
							alert("파일이 없음");
						},500:function(){
							alert("코드 다시 확인");
						}
					}
				})	
			}
		 })
		//댓글 수정창 클릭시 모달에 idx,content
		$("i.aedit").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			//댓글 수정창의 idx에 넣어주기
			$("#idx").val(idx);
			$.ajax({
				type:"get",
				dataType:"json",
				url:"guest/answercontent.jsp",
				data:{"idx":idx},
				success:function(res){
					$("#idx").val(res.idx);
					$("#ucontent").val(res.ctnt);
				}
			});
		});
		$("#btnupdate").click(function(){
			 var idx=$("#idx").val();
			 var content=$("#ucontent").val();
			
			 $.ajax({
				 type:"post",
				 url:"guest/answerupdate.jsp",
				 dataType:"html",
				 data:{"idx":idx,"content":content},
				 success:function(){
					 location.reload();
					 
				 }
			 });
			 
		}) 
	});
		
	
</script>

</head>
<body>
	<%
		guestDao dao=new guestDao(); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		int totalCount=dao.getTotalCount();
		  int perPage=5; //한페이지에 보여질 글의 갯수
		  int perBlock=5; //한블럭당 보여질 페이지의 갯수
		  int startNum; //db에서 가져올 글의 시작번호(mysql:0 오라클:1번)
		  int startPage; //각블럭당 보여질 시작페이지
		  int endPage;//각블럭당 보여질 끝페이지
		  int currentPage; //현재페이지
		  int totalPage; //총페이지
		  int no; //각페이지당 출력할 시작번호
		  
		  //현재페이지 읽기,단 null일경우는 1페이지로 준다
		  if(request.getParameter("currentPage")==null)
			  currentPage=1;
		  else
			  currentPage=Integer.parseInt(request.getParameter("currentPage"));
		//총페이지수를 구한다
		  //총글의 갯수/한페이지당 보여질개수로 나눔(7/5=1)
		  //나머지가 1이라도 있으면 무조건 1페이지추가(1+1=2페이지가 필요)
		  totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		  
		  //각블럭당 보여질 시작페이지
		  //perBlock=5일경우 현재페이지가 1~5 시작1,끝5
		  //만약 현재페이지가 13일경우는 시작11,끝15
		  startPage=(currentPage-1)/perBlock*perBlock+1;
		  endPage=startPage+perBlock-1;
		  
		  //총페이지가 23개일경우 마지막 블럭은 끝 25가 아니라 23이다
		  if(endPage>totalPage)
			  endPage=totalPage;
		  
		  //각페이지에서 보여질 시작번호
		  //예: 1페이지-->0  2페이지-->5 3페이지-->10...
		  startNum=(currentPage-1)*perPage;
		  
		  //각페이지당 출력할 시작번호
		  //예를들어 총글갯수가 23   1페이지: 23  2페이지:18  3페이지: 13.....
		  no=totalCount-(currentPage-1)*perPage;
		  
		  //전체데이타
		  List<guestDto> list=dao.getPageList(startNum, perPage);
		  
		  //세션 데이터
		String loginok=(String)session.getAttribute("loginok");
		String sessionid=(String)session.getAttribute("myid");
		memberDao mdao=new memberDao();
	%>
	<jsp:include page="guestform.jsp"/>
	<hr width="1000">

	<div style="margin: 10px 50px; width: 600px;">
	<%
		if(totalCount==0){%>
			<b>저장된 방명록이 없습니다.</b>
		<%}else{%>
			<b>총 <%=totalCount %>개의 방명록글</b>		
		<%}
	%>
	
	<%
		for(int i=0; i<list.size();i++){
			guestDto dto=list.get(i);
			%>
			<table class="table table-bordered" 
			style="border-color: darkgreen; width:600px;">
				<tr height="220">
				 <td style="width:500px;">
				 
				 	<b font-size="12">(<%=dto.getMyid() %>)</b>
				 	<div style="text-align: right; font-size: 10px; color: gray;">
				 	<%=sdf.format(dto.getWriteday()) %></div>
				 	<hr>
				 	<span font-size="10"><%=dto.getContent().replace("\n", "<br>") %></span>
				 	
				 </td>
				 <td style="text-align: right; width: 150px;">
				 <%
				 //이미지 출력
				 if(!dto.getPhoto().equals("no")){%>
					<img alt="" src="save/<%=dto.getPhoto() %>" 
				 	style="width: 120px; height:150px; float:right;">	 
				 <%}else{%>
					<img alt="" src="image/logoImg/noimage.png"
					style="width: 120px; height:150px; float:right;">					 
				 <%}
				 
				 %>				
					</td>
				</tr>
				
				<!-- 댓글 -->
			<tr>
				<td>
				<%
					//각 방명록 원글에 달린 댓글목록 가져오기
					guestAnswerDao adao=new guestAnswerDao();
					List<guestAnswerDto> alist=adao.getAllGuestAnswers(dto.getNum());
				%>
				<span class="answer" style="cursor: pointer; float: left;">댓글 : <%=alist.size() %></span>
				<div class="answer">
					<%
						if(loginok!=null){%>
							<div class="answerform">
								<form action="guest/answerinsert.jsp" method="post"> 
									<input type="hidden" name="num" value="<%=dto.getNum()%>">
									<input type="hidden" name="myid" value="<%=sessionid%>">
									<input type="hidden" name="currentPage" value="<%=currentPage%>">
									
									<table>
										<tr>
										<td>
											<textarea style="width: 470px; height: 70px;"
											name="content" required="required" class="form-control">
											</textarea>
										</td>
										<td>
											<button type="submit" class="btn btn-info"
											style="width: 60px; height: 60px;">등록
											</button>
										</td>
										</tr>
									</table>
								</form>
				</div>
						<%}
					%>
					<div class="answerlist">
						<table style="width: 500px;">
							<%
								for(guestAnswerDto adto:alist){%>
									<tr>
										<td>
											<%
											String aname=mdao.getName(adto.getMyid()); 
											%>
											<b style="font-size: 0.8em; float: left;"><%=aname %></b>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<%
												//글작성자와 댓글 쓴 작성자가 같을경우
												if(sessionid.equals(adto.getMyid())){%>
													<span style="color: lightgreen; float: left; font-size: 0.7em;"><b>(작성자)</b></span>
												<%}
											%>
											<br>
											<span style="float: left;"><%=adto.getContent().replace("\n", "<br>") %></span>
											<span style="font-size: 0.7em; color: gray; float: right;">
											<%=sdf.format(adto.getWriteday()) %>
											</span>
											<%
									/* 댓글삭제는 본인댓글에만 보이게 */
												if(loginok!=null&&adto.getMyid().equals(sessionid)){%>
												
													<span style="float: right;"><i class="bi bi-trash3-fill ansdel"
													idx="<%=adto.getIdx()%>"></i></span>
													
													<!-- 수정버튼 -->
													<span><i class="bi bi-pencil-square aedit" idx="<%=adto.getIdx() %>" 
													style="float: right; margin-right: 5px;" 
													data-bs-toggle="modal" data-bs-target="#staticBackdrop"></i>
													</span>
												<%}
													
											%>
										</td>
									</tr>
								<%}
							%>
						</table>
					</div>
				</div>
				</td>
			</tr>
			
				
				<tr>
					<td colspan="2">
						<!-- 본인이 쓴 글에만 수정 삭제버튼 보이게 -->
						<%
							/* String loginok=(String)session.getAttribute("loginok"); */
							//로그인중이면서 로그인한 아이디와 글쓴 아이디가 같을 경우에만 보이게
							if(loginok!=null&& sessionid.equals(dto.getMyid())){%>
							<div style="text-align: right;">
								<i class="bi bi-pencil-square update" style="color: cornflowerblue;"></i>
								<i class="bi bi-trash3-fill delete" style="color: darkred;"
								onclick="location.href='guest/delete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
							</div>
							
							
							<%}
						%>
					</td>
				</tr>
				
			</table>
		<%}
	%>
		 <!--페이지 번호 출력  -->
     <div style="width: 800px;">
     <ul class="pagination justify-content-center">
       <%
          //이전
          if(startPage>1)
          {%>
        	  <li class="page-item">
        	    <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1%>"
        	    style="color: black;">
        	      이전
        	    </a>
        	  </li>
          <%}
          
       		for(int pp=startPage;pp<=endPage;pp++)
       		{
       			if(pp==currentPage)
       			{%>
       				<li class="page-item active">
       				  <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
       				</li>
       			<%}else{%>
       				<li class="page-item">
       				  <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
       				</li>
       			<%}
       		}
       		
       		//다음
       		if(endPage<totalPage)
       		{%>
       			<li class="page-item">
        	    <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1%>"
        	    style="color: black;">
        	      다음
        	    </a>
        	  </li>
       		<%}
       			
       %>
     </ul>
     </div>
     
		
	</div>
	<!-- 모달 -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">댓글수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="updateform">
        	<input type="text" id="idx">
        	<input type="text" id="ucontent" class="form-control" style="width: 400px;">
        </div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="btnupdate">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        
      </div>
    </div>
  </div>
</div>
	
</body>
</html>