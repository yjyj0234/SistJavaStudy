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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body{
		width: 100%;
		text-align: center;
		
	}
	ul{
		list-style: none;
		padding-left: 0;
		display: flex;
		justify-content: center;
		gap:20px;
	}
	li>a{
		text-decoration: none;
		color: white;
		font-weight: bold;
		border-radius:20px;
		background-color: darkgreen;
		padding: 10px 20px; /* 상하 10px, 좌우 20px */
   		display: inline-block; /* 패딩 적용을 위해 필요 */
	}
	a:hover{
		background-color: green;
		color: black;
		
	}
	.mo{
		display: block;
		margin-bottom: 10px;
	}
	.idpass{
		width: 200px;
		position:fixed;
		 top: 0;         
    	right: 0; 
	}
</style>

</head>

<body>
	<!--프로젝트 절대경로 -->
	<C:set var="root" value="<%=request.getContextPath() %>"/>
	
	<!-- 제목클릭 시 메인페이지 이동 -->
	<h2><a href="${root }"><img src="${root }/logoImg/img4.jpg"
	height="200"></a>
	</h2>
	<ul>
		<li>
			<a href="${root }/">Home</a>
		</li>
		<li>
			<a href="${root }/ipgo/list">상품목록</a>
		</li>
		<C:if test="${sessionScope.loginok==null }">
			<li>
				<a href="${root }/member/form">회원가입</a>
			</li>
		</C:if>
		<C:if test="${sessionScope.loginok!=null&&myid=='admin' }">
			<li>
				<a href="${root }/member/list">회원목록</a>
			</li>
		</C:if>
		<C:if test="${sessionScope.loginok!=null }">
			<li>
				<!-- requestparameter 통일 -->
				<a href="${root }/member/mypage?idx=${sessionScope.myid}">마이페이지</a>
			</li>
		</C:if>
		<li>
			<a href="${root }/board/list">회원게시판</a>
		</li>
		
	</ul>
<!-- 로그인/로그아웃 -->
	<div class="idpass">
		<C:if test="${sessionScope.loginok==null }">
	  <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#myLoginModal"
	  style="margin-bottom: 10px;">
	    로그인</button>
	  
	  </C:if>
	  <C:if test="${sessionScope.loginok!=null }">
	  	<span>
	  	${loginname }님&nbsp;
	  		<button type="button" class="btn btn-outline-danger" id="logout" 
	  style="margin-bottom: 10px;">
	    로그아웃</button>
	  	<img alt="" src="../membersave/${loginphoto }" style="border-radius: 50px; width: 150px; height: 150px;" class="loginimg">
	  	</span>
	  </C:if>
	</div>

<!-- The Modal -->
<div class="modal fade" id="myLoginModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">로그인 화면</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
       	<table>
       		<tr class="mo">
       			<th width="120">
       				아이디	
       			</th>
       			<td>
       				<input type="text" name="id" class="form-control" id="logid">
       			</td>
       		</tr>
       		<tr class="mo">
       			<th width="120">
       				비밀번호	
       			</th>
       			<td>
       				<input type="password" name="pass" class="form-control" id="loginpass">
       			</td>
       		</tr>
       	</table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal"
      id="btnlogin">로그인</button>
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
	<script type="text/javascript">
		var root='${root}';
		$("#btnlogin").click(function(){
			var id=$("#logid").val();
			var pass=$("#loginpass").val();
			var root='${root}';
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:root+"/member/login",
				data:{"id":id,
					"pass":pass},
					success:function(res){
						if(res.result=='fail'){
							alert("아이디 또는 비밀번호가 일치하지 않습니다");
						}else{
							location.reload();
							
						}
					}
				
			}); 
		});
		$("#logout").click(function(){
			$.ajax({
				type:"get",
				url:root+"/member/logout",
				dataType:"html",
				success:function(){
					location.href="/";
				}
			});
		});
</script>
</body>
</html>