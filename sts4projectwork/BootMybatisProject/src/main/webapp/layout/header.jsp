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
    body {
        font-family: 'Gowun Dodum', 'Nanum Myeongjo', 'Sunflower', sans-serif;
    }
    .navbar-custom {
        background: #f8f9fa;
        box-shadow: 0 2px 12px rgba(0,0,0,0.10);
        border-radius: 0 0 18px 18px;
        padding: 0.5rem 2rem;
    }
    .navbar-brand img {
        height: 60px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.10);
    }
    .nav-link {
        color: #232323 !important;
        font-weight: 500;
        border-radius: 8px;
        padding: 0.5rem 1.2rem !important;
        transition: background 0.18s, color 0.18s;
        display: flex;
        align-items: center;
        gap: 0.4em;
    }
    .nav-link:hover, .nav-link.active {
        background: #232323 !important;
        color: #fff !important;
    }
    .profile-card {
        background: #fff;
        color: #232323;
        border-radius: 16px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.10);
        padding: 1rem 1.5rem;
        min-width: 220px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: fixed;
        top: 24px;
        right: 32px;
        z-index: 2000;
    }
    .profile-card .loginimg {
        border-radius: 50%;
        width: 70px;
        height: 70px;
        object-fit: cover;
        margin-top: 0.5rem;
        box-shadow: 0 2px 8px rgba(0,0,0,0.10);
    }
    .profile-card .btn {
        width: 100%;
        margin-top: 0.5rem;
    }
    .modal-content {
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.18);
    }
    .modal-header {
        border-radius: 18px 18px 0 0;
        background: #f8f9fa;
        color: #232323;
    }
    .modal-title {
        font-weight: 600;
    }
    .modal-footer {
        border-radius: 0 0 18px 18px;
    }
</style>
</head>
<body>
<C:set var="root" value="<%=request.getContextPath() %>"/>
<nav class="navbar navbar-expand-lg navbar-custom sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="${root }">
      <img src="${root }/logoImg/img4.jpg" alt="로고">
    </a>
    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="mainNavbar">
      <ul class="navbar-nav mb-2 mb-lg-0 gap-2">
        <li class="nav-item">
          <a href="${root }/" class="nav-link"><i class="bi bi-house-door"></i> Home</a>
        </li>
        <li class="nav-item">
          <a href="${root }/ipgo/list" class="nav-link"><i class="bi bi-box-seam"></i> 상품목록</a>
        </li>
        <C:if test="${sessionScope.loginok==null }">
          <li class="nav-item">
            <a href="${root }/member/form" class="nav-link"><i class="bi bi-person-plus"></i> 회원가입</a>
          </li>
        </C:if>
        <C:if test="${sessionScope.loginok!=null&&myid=='admin' }">
          <li class="nav-item">
            <a href="${root }/member/list" class="nav-link"><i class="bi bi-people"></i> 회원목록</a>
          </li>
        </C:if>
        <C:if test="${sessionScope.loginok!=null }">
          <li class="nav-item">
            <a href="${root }/member/mypage?idx=${sessionScope.myid}" class="nav-link"><i class="bi bi-person-circle"></i> 마이페이지</a>
          </li>
        </C:if>
        <li class="nav-item">
          <a href="${root }/board/list" class="nav-link"><i class="bi bi-chat-dots"></i> 회원게시판</a>
        </li>
      </ul>
    </div>
    <div class="d-none d-lg-block position-relative">
      <C:if test="${sessionScope.loginok==null }">
        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#myLoginModal">
          <i class="bi bi-box-arrow-in-right"></i> 로그인
        </button>
      </C:if>
      <C:if test="${sessionScope.loginok!=null }">
        <div class="profile-card">
          <span class="fw-bold">${loginname }님</span>
          <button type="button" class="btn btn-outline-danger" id="logout">
            <i class="bi bi-box-arrow-right"></i> 로그아웃
          </button>
          <img alt="프로필" src="../membersave/${loginphoto }" class="loginimg mt-2">
        </div>
      </C:if>
    </div>
  </div>
</nav>
<!-- 모바일/태블릿용 로그인 버튼 (네비게이션 아래) -->
<div class="d-lg-none text-end p-2">
  <C:if test="${sessionScope.loginok==null }">
    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#myLoginModal">
      <i class="bi bi-box-arrow-in-right"></i> 로그인
    </button>
  </C:if>
  <C:if test="${sessionScope.loginok!=null }">
    <div class="profile-card" style="position:static; box-shadow:none; background:#f8f9fa; color:#232323; min-width:0; padding:0.5rem 1rem;">
      <span class="fw-bold">${loginname }님</span>
      <button type="button" class="btn btn-outline-danger w-100 mt-1" id="logout-mobile">
        <i class="bi bi-box-arrow-right"></i> 로그아웃
      </button>
      <img alt="프로필" src="../membersave/${loginphoto }" class="loginimg mt-2">
    </div>
  </C:if>
</div>
<!-- The Modal -->
<div class="modal fade" id="myLoginModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><i class="bi bi-box-arrow-in-right"></i> 로그인 화면</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form onsubmit="return false;">
          <div class="mb-3 row align-items-center">
            <label for="logid" class="col-sm-3 col-form-label">아이디</label>
            <div class="col-sm-9">
              <input type="text" name="id" class="form-control" id="logid" autocomplete="username">
            </div>
          </div>
          <div class="mb-3 row align-items-center">
            <label for="loginpass" class="col-sm-3 col-form-label">비밀번호</label>
            <div class="col-sm-9">
              <input type="password" name="pass" class="form-control" id="loginpass" autocomplete="current-password">
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal" id="btnlogin">
          <i class="bi bi-box-arrow-in-right"></i> 로그인
        </button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    var root='${root}';
    $(function(){
      $("#btnlogin").click(function(){
        var id = $("#logid").val();
        var pass = $("#loginpass").val();
        $.ajax({
          type: "get",
          dataType: "json",
          url: root+"/member/login",
          data: {"id":id, "pass":pass},
          success: function(res){
            if(res.result=='fail'){
              alert("아이디 또는 비밀번호가 일치하지 않습니다");
            }else{
              location.reload();
            }
          }
        });
      });
      $("#logout, #logout-mobile").click(function(){
        $.ajax({
          type: "get",
          url: root+"/member/logout",
          dataType: "html",
          success: function(){
            location.href="/";
          }
        });
      });
    });
</script>
</body>
</html>