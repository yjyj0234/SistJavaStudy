<%@page import="mymall.MymallDto"%>
<%@page import="java.util.List"%>
<%@page import="mymall.MymallDao"%>
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
<script type="text/javascript">
	$(function(){
		var selimg=$("#photo").val();
		$("#myphoto").attr("src","../image/쇼핑몰사진/"+selimg+".jpg"); 
	})
</script>
</head>
<body>
	<div style="margin:100px 100px; width:400px;">
		<form action="addAction.jsp" method="post">
			<table class="table table-bordered">
				<tr>
					<th class="table-success">상품명</th>
					<td>
						<input type="text" name="sangpum" required="required" class="form-control" style="width:150px;">
					</td>	
				</tr>
				<tr>
					<th class="table-success">상품이미지</th>
					<td class="input-group">
						<select name="photo" id="photo" class="form-control" style="max-width:250px;">
							<option value="12">샤넬st 단화</option>
							<option value="30">머리핀</option>
							<option value="34">기모 숏팬츠</option>
							<option value="24">와이드핏 롱팬츠</option>
							<option value="25">블라우스</option>
							<option value="33">원피스</option>
						</select>&nbsp;
						<img alt="" src="" width="30" height="30" id="myphoto">
						<script type="text/javascript">
							$("#photo").change(function(){
								var s="../image/쇼핑몰사진/"+$(this).val()+".jpg"
								$("#myphoto").attr("src",s );
							})
						</script>
					</td>	
				</tr>				
				<tr>
					<th class="table-success" width="100">색상</th>
					<td>
						<input type="color" name="color"
						class="form-control" style="width:150px;">
					</td>	
				</tr>
				<tr>
					<th class="table-success" width="100">가격</th>
					<td>
						<input type="text" name="price" required="required"
						class="form-control" style="width:150px;">
					</td>	
				</tr>
				<tr>
					<th class="table-success" width="100">입고날짜</th>
					<td>
						<input type="date" name="ipgoday"
						class="form-control" style="width:200px;">
					</td>	
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-outline-success" value="상품저장">
						<input type="button" class="btn btn-outline-info" value="상품목록"
						onclick="location.href='mallList.jsp'">
					</td>
				</tr>
			</table>		
		</form>
	</div>
</body>
</html>