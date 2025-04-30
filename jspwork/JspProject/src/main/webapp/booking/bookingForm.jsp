<%@page import="booking.BookingDto"%>
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
		body*{
			font-family:'Sunflower';
			
		}
	</style>    
	<script type="text/javascript">
		function check(){
			var len=$("input[name='food']:checked").length;
			if(len<2){
				alert("주문 메뉴는 최소 2개이상 골라주세요");
				return false;
			}
		}
	</script>
</head>
<body>
	<div style="margin:100px 100px;width:800px;">
	<!-- onsubmit 이벤트: action 이 호출되기 전에 발생.
	 리턴값을 false로 받으면 action값이 아예 발생하지 않음 -->
		<form action="addAction.jsp" method="post" onsubmit="return check()">
			<table class="table table-bordered">
				<tr>
					<th width="100" style="background-color:skyblue">예약자명</th>
					<td>
						<input type="text" name="name" class="form-control"
						autofocus="autofocus" required="required" style="width:200px;" placeholder="예약자명 입력">
					</td>
				</tr>
				
				<tr>
					<th width="100" style="background-color:skyblue">성별</th>
					<td>
					<label>
						<input type="radio" name="gender" value="m">
						<img alt="" src="../image/bookimage/man.png" width="100">
						
					</label>
					&nbsp;
					<label>
						<input type="radio" name="gender" value="f" checked="checked">
						<img alt="" src="../image/bookimage/woman.png" width="100">
						
					</label>
					</td>
				</tr>
				<tr>
					<th width="100" style="background-color:skyblue">예약시간</th>
					<td>
					<!-- 시간까지 정해야 할경우 -->
						<input type="datetime-local" name="local" class="form-control" style="width:300px;" required="required">
					</td>
				</tr>
				<tr>
					<th width="100" style="background-color:skyblue">인원수</th>
					<td>
						<input type="number" name="inwon" min="2" max="6" class="form-control" style="width:100px;">
					</td>
				</tr>
				<tr>
					<th width="100" style="background-color:skyblue">메뉴선택</th>
					<td>
						<label>
							<input type="checkbox" name="food" value="콘치즈.jpg,8000">콘치즈<br>
							<img alt="" src="../image/bookimage/콘치즈.jpg" width="80" height="80" border="1">
						</label>
						
						<label>
							<input type="checkbox" name="food" value="망고빙수.jpg,14000">망고빙수<br>
							<img alt="" src="../image/bookimage/망고빙수.jpg" width="80" height="80" border="1">
						</label>	
						<label>
							<input type="checkbox" name="food" value="육개장칼국수.jpg,9000">육개장<br>
							<img alt="" src="../image/bookimage/육개장칼국수.jpg" width="80" height="80" border="1">
						</label>
						<label>	
							<input type="checkbox" name="food" value="에그샌드위치.jpg,6000">샌드위치<br>
							<img alt="" src="../image/bookimage/에그샌드위치.jpg" width="80" height="80" border="1">
						</label>
						<label>	
							<input type="checkbox" name="food" value="스팸마요덮밥.jpg,5000">스팸마요<br>
							<img alt="" src="../image/bookimage/스팸마요덮밥.jpg" width="80" height="80" border="1">
						</label>
					</td>
				</tr>
				<tr>
					<th width="100" style="background-color:skyblue">메세지</th>
					<td>
						<textarea style="width:500px; height:80px;" class="form-control" required="required" name="message" placeholder="메세지"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-danger" style="width:120px;" id="btn1">예약하기</button>
						<button type="reset" class="btn btn-outline-danger" style="width:120px;">다시하기</button>
						<button type="submit" class="btn btn-outline-danger" style="width:120px;"
						onclick="location.href='bookingList.jsp'">예약목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>