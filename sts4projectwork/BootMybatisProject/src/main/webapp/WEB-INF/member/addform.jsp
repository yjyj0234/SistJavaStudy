<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	body{
		width: 100%;
		margin: 0;
	}
	.container{
		display: flex;
		flex-direction: column; /* 세로로 쌓기 */
		align-items: center;
		justify-content: center;
	}
	#showimg{
		width: 130px;
		height: 160px;
		border: 1px solid gray;
	}
</style>
<script type="text/javascript">
$(function(){
	//버튼클릭시 사진 불러오기
	$("#btnphoto").click(function(){
		$("#myphoto").trigger("click");
	
	});
	//사진을 불러오면 그 밑에 미리보기
		$("#myphoto").change(function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            
            reader.onload = function(event) {
                $("#showimg").attr("src", event.target.result);
            };
            
            reader.readAsDataURL(file);
        }
		});
	//아이디 입력시 중복체크
	$("#btnidcheck").click(function(){
		var id=$("#loginid").val();
		alert(id);
		$.ajax({
			type:"get",
			dataType:"json",
			url:"idcheck",
			data:{"id":id},
			success:function(res){
				/* 넘어오는값: res */
				if(res.idresult==0){
					$("span.idsuccess").text("ok");
					$("span.idsuccess").css("color","green");
				}else{
					$("span.idsuccess").text("fail");
					$("span.idsuccess").css("color","red");
					
					$("#loginid").val('');
				}
			}
		});
	});
	//2번째 비밀번호 입력 시 체크
	$("#pass2").keyup(function(){
		var p1=$("#pass").val();
		var p2=$("#pass2").val();
		if(p1==p2){
			$("span.passsuccess").text("ok");
		}else{
			$("span.passsuccess").text("fail");
		}

	});
});
//submit하기 전에 호출(반드시 해야하는것들)
function check() {
	//사진
	if($("#myphoto").val()==''){
		alert("프로필사진을 넣어주세요");
		return false;
	}
	//중복체크
	if($("span.idsuccess").text()!='ok'){
		alert("아이디 중복체크를 해주세요");
		return false;
	}
	//비밀번호
	if($("span.passsuccess").text()!='ok'){
		alert("비밀번호가 서로 다릅니다 ");
		return false;
	}
}
</script>
</head>
<body>
	<div>
		<jsp:include page="../../layout/header.jsp"/>
	</div>
	<div class="container">
		<br><br>
		<!-- null값 안들어가게 onsubmit -->
		<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top"><b>회원가입</b></caption>
				<tr>
					<td style="width: 250px;" rowspan="5" align="center">
					<!--사진 넣자마자 바로 확인가능해야함-->
						<input type="file" id="myphoto" name="myphoto" style="display: none;">
						<br>
						<img alt="" src="" id="showimg">
						<button type="button" class="btn btn-outline-dark" style="margin-top: 35%;"
						id="btnphoto">프로필사진 선택</button>
						
					</td>
					<td>
						<div class="input-group">
						<input type="text" placeholder="아이디입력" id="loginid" name="id"
						class="form-control" style="width: 120px;" required="required">&nbsp;&nbsp;
						<button type="button" class="btn btn-danger btn-sm" 
						id="btnidcheck">중복체크</button>
						<span class="idsuccess" style="width: 60px; color: green;"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group">
						<input type="password" name="pass" class="form-control" style="width: 120px;" id="pass"
						placeholder="숫자4자리" required="required">
						<input type="password" class="form-control" style="width: 120px;" id="pass2"
						placeholder="숫자4자리" required="required">
						<span class="passsuccess" style="width: 60px;"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="name" class="form-control" style="width: 300px;"
						required="required" placeholder="이름">
					</td>
				</tr>
					<tr>
					<td>
						<input type="text" name="hp" class="form-control" style="width: 300px;"
						required="required" placeholder="전화번호">
					</td>
				</tr>
					<tr>
					<td>
						<input type="text" name="email" class="form-control" style="width: 300px;"
						required="required" placeholder="이메일">
					</td>
				</tr>
					<tr>
					<td colspan="2">
					<input type="submit" class="btn btn-outline-dark" value="가입">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>