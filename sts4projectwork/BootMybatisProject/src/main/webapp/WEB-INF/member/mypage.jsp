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
	div.list{
		width: 100%;
		width: 800px;
		margin: 0 auto;
		text-align: center;
	}
	.btncell{
		vertical-align: middle;
	}
</style>
</head>
<script type="text/javascript">
	$(function(){
		$(".btnnewphoto").click(function(){
			$("#newphoto").trigger("click");
		});
		$("#newphoto").change(function(){
			const num=$(this).attr("num");
			console.log(num);
			
			var form=new FormData();
			form.append("photo",$("#newphoto")[0].files[0]); //선택한 한개만 추개
			form.append("num",num);
			
			console.dir(form);
			//이미지 전송을 위해 필요한 것들
			//processData:false = ajax하면서 서버에 전달하는 데이터 
			//contentType:false = enctype관련?
			$.ajax({
				type:"post",
				dataType:"html",
				url:"updatephoto",
				processData:false,
				contentType:false,
				data:form,
				success:function(){
					location.reload();
				}
			});
		})
	
		
		/* 수정할때 num값 포함해서  넘기기 */
		$("#btnupdate").click(function(){
			const num=$(this).attr("num");
			var name=$("#myname").val();
			var hp=$("#myhp").val();
			var email=$("#myemail").val();
			console.log(num);
			console.log(name);
			/* void여서 반환받을 dataType없음 */
			$.ajax({
				type:"post",
				url:"/member/update",
				data:{
					"num":num,
					"name":name,
					"hp":hp,
					"email":email
				},
				success:function(){
					location.reload();
					alert("success");
				}
			}); 
		});
	});
</script>
<body>
		<jsp:include page="../../layout/header.jsp"/>

	<div class="alert alert-success list" style="width: 800px;">
		${loginid }
	</div>
	<div style="width: 800px;" class="list">
	<table class="table table-bordered" style="width: 800px;">
		<C:if test="${sessionScope.loginok!=null }">
		<tr>
			<td rowspan="5" width="250">
			<C:if test="${mdto.photo!='no' }">
					<img alt="" src="../membersave/${loginphoto }" width="200" height="220">
					<br><br>
					<!-- 버튼 눌렀을때 num이 있어야 num으로부터 이미지 값을 가져올 수 있다 -->
					<input type="file" id="newphoto" style="display: none;" num="${mdto.num }">
					<button type="button" class="btn btn-outline-success btnnewphoto">프로필 사진 수정</button>
			</C:if>
			</td>
			<td>
				이름 : ${mdto.name }
			</td>
			<td colspan="2" rowspan="5" class="btncell">
				<button class="btn btn-outline-dark btn-sm getdata" data-bs-toggle="modal" data-bs-target="#myupModal"
				 >수정</button>
				<button class="btn btn-outline-danger btn-sm btndel" num="${mdto.num}">삭제</button>
			</td>
		</tr>
		<tr>
			<td>
				id : ${mdto.id }
			</td>
		</tr>
		<tr>
			<td>
				hp : ${mdto.hp }
			</td>
		</tr>
		<tr>
			<td>
				이메일 : ${mdto.email }
			</td>
		</tr>
		<tr>
			<td>
				가입일 : <fmt:formatDate value="${mdto.gaipday }" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			
		</tr>
		</C:if>
	</table>
	</div>
	
	
	<!-- The Modal -->
<div class="modal fade" id="myupModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">수정 화면</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
       	<table>
       		<tr class="mo">
       			<th width="120">
       				이름
       			</th>
       			<td>
       				<input type="text" name="name" class="form-control" id="myname" value="${mdto.name }">
       			</td>
       		</tr>
       		<tr class="mo">
       			<th width="120">
       				전화번호
       			</th>
       			<td>
       				<input type="text" name="hp" class="form-control" id="myhp" value="${mdto.hp }">
       			</td>
       		</tr>
       		<tr class="mo">
       			<th width="120">
       				이메일	
       			</th>
       			<td>
       				<input type="text" name="email" class="form-control" id="myemail" value="${mdto.email }">
       			</td>
       		</tr>
       	</table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal"
      id="btnupdate" num="${mdto.num}">수정</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>