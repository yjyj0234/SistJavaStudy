<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.memberDto"%>
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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<%
	memberDao dao=new memberDao();
	String num=request.getParameter("num");
	memberDto dto=dao.getData(num);
	
	StringTokenizer stk=new StringTokenizer(dto.getEmail(),"@");
	//이메일 분리(@ 기준으로)
	//int indx=dto.getEmail().indexof('@');
	//String email1=dto.getEmail().substring(0,idx); 
%>
<script type="text/javascript">
	$(function() {
		//이메일 선택 이벤트
		$("#selemail").change(function(){
			if($(this).val()=='-'){
				$("#email2").val('');
			}else{
				$("#email2").val($(this).val());
			}
				
		})
	})

</script>
<style type="text/css">
	th{
		vertical-align: middle;
	}
</style>
</head>
<body>
<div style="margin: 100px 150px;">
	<!-- 대용량 데이터전송시: post -->
	<!-- onsubmit 제출전에 유효성 검사를 해줌 -->
	<form action="member/memberupdate.jsp" method="post" onsubmit="return check(this)">
				<input type="hidden" name="num" value="<%=num%>">
	<table class="table table-bordered" style="width:500px;">
		<caption align="top"><b>내 정보 수정</b></caption>
		<tr>
			<th width="100" class="table-info">아이디</th>
			<td class="input-group">
				<input type="text" name="id" id="id" class="form-control" maxlength="12" 
				required="required" style="width: 150px;" value="<%=dto.getId()%>"
				readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;
				
			</td>
		</tr>
		<tr>
			<th width="100" class="table-info">현재비번</th>
			<td class="input-group">
				<input type="password" name="pass" class="form-control"
				required="required" style="max-width: 160px;" placeholder="비밀번호">
			</td>
		</tr>
		<tr>
		<tr>
			<th width="100" class="table-info">수정할비번</th>
			<td class="input-group">
				<input type="password" name="pass2" class="form-control"
				required="required" style="max-width: 160px;" placeholder="수정할 비밀번호">
			</td>
		</tr>
		<tr>
		<th width="100" class="table-info">이름 수정</th>
			<td class="input-group">
		<input type="text" name="name" id="name" class="form-control" maxlength="12" 
				required="required" style="width: 150px;" value="<%=dto.getName()%>">
				</td>
		</tr>
		<tr>
		<th width="100" class="table-info">이메일</th>
			<td class="input-group">
		<input type="text" name="email1" class="form-control" value="<%=stk.nextToken()%>"
				required="required" style="max-width: 80px;">
				<h4 style="margin: 5px;">@</h4>
		<input type="text" name="email2" id="email2" class="form-control" 
				required="required" style="max-width: 130px;" value="<%=stk.nextToken()%>">
				<select id="selemail" class="form-control">
					<option value="-">직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="hanmail.net">다음</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<button type="submit" class="btn btn-outline-info"
				style="width:100px;">수정하기</button>
				<button type="reset" class="btn btn-outline-info"
				style="width:100px;">초기화</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>