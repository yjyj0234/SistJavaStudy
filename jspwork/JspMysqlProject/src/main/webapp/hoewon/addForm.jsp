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
	

</style>

<script type="text/javascript">
	function openId() {
		window.open("idCheck.jsp","","left=100px,top=100px,width=300px,height=150px");
	}	
	$(function(){
		//아이디 입력 안하면 회원가입 못하게 
		$("#btnSubmit").click(function(){
			if(frm.mid.value.length==0){
				alert("아이디 입력버튼을 눌러주세요");
				return false;//action호출안됨
			}
		})
	})
</script>

</head>
<body>
	<div style="margin:100px 100px; width:500px">
		<form action="addAction.jsp" method="post" name="frm">
		<table class="table table-bordered">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th class="table-warning" width="120">아이디</th>
				<td class="input-group">
					<input type="text" name="mid" style="max-width: 160px;" class="form-control"
					 required="required" readonly="readonly">&nbsp;&nbsp;&nbsp;
					 <button type="button" class="btn btn-danger btn-sm" onclick="openId()">아이디입력
					 </button>
				</td>
			</tr>
				<tr>
				<th class="table-warning" width="120">비밀번호</th>
				<td>
					<input type="password" name="pass" style="max-width: 120px;" class="form-control"
					 required="required" >&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
				<tr>
				<th class="table-warning" width="120">이름</th>
				<td class="input-group">
					<input type="text" name="name" style="max-width: 160px;" class="form-control"
					 required="required">&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
				
				<tr>
				<th class="table-warning" width="120">핸드폰</th>
				<td class="input-group">
					<input type="text" name="hp" style="max-width: 200px;" class="form-control"
					 required="required">&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success" id="btnSubmit" style="width:150px;" >회원가입하기</button>
			</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>