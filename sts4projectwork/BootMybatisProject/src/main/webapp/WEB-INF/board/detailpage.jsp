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
<style type="text/css">
.day{
	float: right;
}
.adel,.aup{
	cursor: pointer;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		num=$("#num").val();
		list(); //페이지가 로드될 때 바로 댓글 목록 표시
		/* dataType : 매핑이 void면 응답받는게 없어서 json으로 못씀 */
		$("#btnansweradd").click(function(){
			//alert(num);
			var content=$("#content").val();
			if(content.trim().length==0){
				alert("내용 입력 해주세요");
				return;
			}
			$.ajax({
				type:"post",
				dataType:"html",
				url:"ainsert",
				data:{"num":num,
					"content":content},
				success:function(){
					alert("작성완료");
					list();
					$("#content").val("");
				}
			});
			
		});
		/* ajax에 있는 내용 클릭하려면 document사용 */
		$(document).on("click",".adel",function(){
			var idx=$(this).attr("idx");
			$.ajax({
				type:"get",
				dataType:"html",
				url:"adelete",
				data:{"idx":idx},
				success:function(){
					alert("삭제되었습니다");
					location.reload();
				}
			})
			
		});
	});
	function list() {
		loginok="${sessionScope.loginok}";
		myid="${sessionScope.myid}";
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"alist",
			data:{"num":num},
			success:function(res){
				$(".acount").text(res.length);
				var s="";
				$.each(res,function(i,dto){
					s+="<b>"+dto.name+"&nbsp;&nbsp;</b>"+dto.content;
					s+="<span class='day'>"+dto.writeday+"&nbsp;";
					if(loginok=='yes'&&myid==dto.myid){
						s+="<i class='bi bi-pencil-square aup'></i>"
						s+="<i class='bi bi-trash-fill adel' idx='"+dto.idx+"'></i>"
						s+="</span><br>";
					}
					$(".alists").html(s);
				});
				
			}
			
		});
		
	}
</script>
</head>
<body>
<div class="container">
		<jsp:include page="../../layout/header.jsp"/>
	<table class="table table-bordered" style="width: 700px;">
		<tr>
			<td>
			<h4>${dto.subject }</h4>
			<span style="font-size: 9pt; color: gray; float: right;">
			<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm:ss"/>
			&nbsp;&nbsp;조회수 ${dto.readcount }
			</span>
			
			<br>
			<span style="float: right;">
				<b>작성자 : ${dto.name }(${dto.myid })</b>
			</span>
			<br>
			<C:if test="${dto.uploadfile!='no' }">
				<span>
					<a href="download?clip=${dto.uploadfile }">
					<i class="bi bi-arrow-bar-down">${dto.uploadfile }</i>
					</a>
				</span>&nbsp;&nbsp;&nbsp;
			</C:if>
			</td>
		</tr>
		<tr height="300px;">
			<td>
				<C:if test="${dto.uploadfile!='no' }">
				<h3>업로드파일이 이미지입니다</h3>
					<img alt="" src="../boardsave/${dto.uploadfile }">
				</C:if><br>
				<pre>${dto.content }</pre>
			</td>
		</tr>
		<!-- 댓글 -->
		<tr>
			<td>
				<b>댓글 <span class="acount">0</span></b>
				<div class="alist">리스트</div>
				<input type="hidden" id="num" value="${dto.num }">
				<C:if test="${sessionScope.loginok!=null }">
					<div class="aform input-group">
						<input type="text" class="form-control"
						style="width: 550px;" placeholder="댓글을 입력하시오" id="content">
						<button type="button" class="btn btn-success" 
						style="width: 60px;" id="btnansweradd">전송</button>
					</div>
				</C:if>
				</td>
		</tr>
		<tr>
			<td>
				<div class="alists">
					
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<!-- 글쓰기: 로그인 중일때만 보이게 -->
				<C:if test="${sessionScope.loginok=='yes' }">
					<button class="btn btn-outline-secondary">글쓰기</button>
				</C:if>
				<button class="btn btn-outline-dark" onclick="location.href='list'">목록</button>
				<!-- 수정삭제: 로그인 중이면서 세션아이디가 글쓴이와 같은 아이디일 경우 보이게 -->
				<C:if test="${sessionScope.loginok=='yes'&&sessionScope.myid==dto.myid }">
					<button class="btn btn-outline-info">수정</button>
					<button class="btn btn-outline-danger">삭제</button>
				</C:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>