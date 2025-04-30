<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="booking.BookingDto"%>
<%@page import="booking.BookingDao"%>
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
		BookingDao dao=new BookingDao();
		List<BookingDto> list=dao.getAllDatas();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
	
		
	%>
	<div style="margin:100px 100px;width:800px;">
		<div>
			<h4 style="background-color: lightgray; height:60px; text-align:center;"><b style="vertical-align: middle">전체 예약목록</b><br><h5>총 <%=list.size() %>팀 예약 중</h5></h4>
			<button type="button" class="btn btn-success" onclick="location.href='bookingForm.jsp'">예약하기</button>
		</div>
		<br>
		<table class="table table-bordered">
			<tr >
				<th width="50" style="background-color:lightgray;">번호</th>
				<th width="100" style="background-color:lightgray;">예약자명</th>
				<th width="120" style="background-color:lightgray;">예약시간</th>
				<th width="50" style="background-color:lightgray;">인원수</th>
				<th width="120" style="background-color:lightgray;">접수시간</th>
				<th width="70" style="background-color:lightgray;">비고</th>	
			</tr>
			
				<%
					if(list.size()==0){%>
					<tr>
						<td colspan="5" style="text-align:center"><h3>아직 등록된 정보가 없습니다</h3></td>
					</tr>
					<%}else{
						for(int i=0;i<list.size();i++){
							BookingDto dto=list.get(i);
							
							%>
							<tr>
							<td><%=list.size()-i %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getBookday().substring(0,10)+"  "+dto.getBookday().substring(11,16) %></td>
							<td><%=dto.getInwon() %></td>
							<td><%=sdf.format(dto.getWriteday()) %></td>
							<td><button type="button" class="btn btn-info" onclick="location.href='bookingView.jsp?num=<%=dto.getNum()%>'">상세정보</button></td>
							</tr>
						<%}
					}
				%>
			
		</table>
	</div>
</body>
</html>