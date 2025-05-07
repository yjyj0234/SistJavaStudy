<%@page import="java.util.StringTokenizer"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<style>
	
</style>
<script>
<%
	String num=request.getParameter("num");
	BookingDao dao=new BookingDao();
	BookingDto dto=dao.getData(num);
%>
	function deleteBook(num) {
		var a=confirm("해당 주문사항을 삭제하려면 눌러주세요");
		if(a){
			location.href="deleteBooking.jsp?num="+<%=dto.getNum()%>;
			alert("삭제되었습니다.");
		}
			
	}
</script>
    <%
    	//num값 구해서 넘어오기 
    	
		
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
    	
    	String [] fp=dto.getFoodphoto().split(",");
    	String photo="";
    	String pname="";
    	
    	for(int i=0;i<fp.length;i++){
    		photo+="<img src='../image/bookimage/"+fp[i]+"' width='100' height='100' border='1' style='margin-right:2px'>";
    		StringTokenizer st=new StringTokenizer(fp[i],".");
    		pname+=st.nextToken()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    	}
    	
    	
    	String [] fc=dto.getFoodprice().split(",");
    	String price="";
    	int tot=0;
    	for(int i=0;i<fc.length;i++){
    		price+=fc[i]+"원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    		
    		tot+=Integer.parseInt(fc[i]);
    	}
    	
    	String gender="";
    %>

</head>
<body>
<div style="margin:100px 100px;width:700px;">
	<table class="table table-bordered">
		<tr >
			<th width="150" style="background-color:coral">예약자명</th>
			<td><%=dto.getName() %></td>
			<td rowspan="3"><img src="../image/bookimage/<%=dto.getGender().trim().equalsIgnoreCase("m")?"man":"woman" %>.png" width="100"><br><%=dto.getGender() %></td>
			
			
			
		</tr>
		<tr>
			<th style="background-color:coral">예약시간</th>
			<td><%=dto.getBookday().substring(0,10) +" "+ dto.getBookday().substring(11,16) %></td>
		</tr>
		<tr>
			<th style="background-color:coral">인원 수</th>
			<td><%=dto.getInwon() %>명</td>
		</tr>
		<tr>
			<th style="background-color:coral">주문시간</th>
			<td><%=sdf.format(dto.getWriteday()) %></td>
		</tr>
		<tr>
			<th style="background-color:coral">주문 메세지</th>
			<td><%=dto.getMessage() %></td>
		</tr>
		<tr colspan="2">
			<th style="background-color:coral">주문 메뉴</th>
			<td><%=photo %><br> <%=pname%><br><%=price %></td>
			<td> <h2>총 가격</h2><br><b><%=tot %>원</b></td>
		</tr>
		<button type="button" class="btn btn-danger" onclick="deleteBook()">삭제</button>
		<button type="button" class="btn btn-info" onclick="location.href='bookingUpdateForm.jsp?num=<%=num%>'">수정</button>
		<button type="button" class="btn btn-secondary" onclick="location.href='bookingList.jsp'">목록</button>
			
		
		
	</table>
</div>
</body>
</html>