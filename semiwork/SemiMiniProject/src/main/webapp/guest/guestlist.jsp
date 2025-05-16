

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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<title>Insert title here</title>
<style type="text/css">
	i.delete{
		cursor: pointer;
	}
	i.update{
		cursor: pointer;
	}
</style>
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
					<img alt="" src="../save/<%=dto.getPhoto() %>" 
				 	style="width: 150px; height:200px; float:right;">	 
				 <%}else{%>
					<img alt="" src="../image/logoImg/noimage.png"
					style="width: 150px; height:200px; float:right;">					 
				 <%}
				 
				 %>				 

					</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 본인이 쓴 글에만 수정삭제버튼 보이게 -->
						<%
							String loginok=(String)session.getAttribute("loginok");
							String sessionid=(String)session.getAttribute("mid");
							//로그인중이면서 로그인한 아이디와 글쓴 아이디가 같을 경우에만 보이게
							if(loginok!=null&& sessionid.equals(dto.getMyid())){%>
							<div style="text-align: right;">
								<i class="bi bi-pencil-square update" style="color: cornflowerblue;"></i>
								<i class="bi bi-trash3-fill delete" style="color: darkred;"
								onclick="location.href='delete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
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
        	    <a class="page-link" href="guestlist.jsp?currentPage=<%=startPage-1%>"
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
       				  <a class="page-link" href="guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
       				</li>
       			<%}else{%>
       				<li class="page-item">
       				  <a class="page-link" href="guestlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
       				</li>
       			<%}
       		}
       		
       		//다음
       		if(endPage<totalPage)
       		{%>
       			<li class="page-item">
        	    <a class="page-link" href="guestlist.jsp?currentPage=<%=endPage+1%>"
        	    style="color: black;">
        	      다음
        	    </a>
        	  </li>
       		<%}
       			
       %>
     </ul>
     </div>
     
		
	</div>
	
	
</body>
</html>