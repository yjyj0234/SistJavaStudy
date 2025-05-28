<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.memberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Hi+Melody&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
  img.photo{
    width: 60px;
    height: 80px;
    border: 1px solid gray;
  }
</style>
<script type="text/javascript">
  $(function(){
	  
	  //전체체크박스 선택/해제
	  $("#allcheck").click(function(){
		  
		  var chk=$(this).is(":checked");
		  
		  //전체에 일괄전달
		  $(".idx").prop("checked",chk);
	  });
	  
	  //상품선택시 디테일로 이동
	  $("div.sanginfo").click(function(){
		  
		  var shopnum=$(this).attr("shopnum");
		  //alert(shopnum);
		  location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
	  });
	  
	  //선택상품삭제
	  $("#btncartdel").click(function(){
		  
		  //체크된개수
		  var cnt=$(".idx:checked").length;
		 //alert(cnt);
		 
		 if(cnt==0){
			 alert("먼저 삭제할 상품을 최소1개 선택해주세요");
			 return;
		 }
		 
		 $(".idx:checked").each(function(i,ele){
			 
			 var idx=$(this).attr("idx");
			 console.log(idx);
			 
			 //선택한것 장바구니 모두삭제
			 del(idx);
		 });
		 
		 //현재페이지 새로고침
		 location.reload();
	  });
	  
	  //가격옆의 삭제창 경고
	  $("i.del").click(function(){
		  
		  var idx=$(this).attr("idx");
		 // alert(idx);
		 var a=confirm("삭제하려면 [확인]을 눌러주세요");
		 
		 if(a){
			 //alert(idx);
			 del(idx);
			 location.reload(); //새로고침
		 }
	  });
	  
	  
		  
	  
  });
  
  
  //삭제 사용자 함수
  function del(idx)
  {
	  $.ajax({
		  type:"get",
		  url:"shop/cartdelete.jsp",
		  dataType:"html",
		  data:{"idx":idx},
		  success:function(){
			  
		  }
	  });
  }
  

</script>
</head>
<%
  String id=(String)session.getAttribute("myid");
  ShopDao dao=new ShopDao();
  //장바구니 목록
  List<HashMap<String,String>> list=dao.getCartList(id);
  
  //이름
  memberDao mdao=new memberDao();
  String name=mdao.getName(id);
  
//화폐
  NumberFormat nf=NumberFormat.getCurrencyInstance();

  int totmoney=0;
%>
<body>
<div style="margin: 100px 100px; width: 800px;" >
  <h4 class="alert alert-success"><%=name %>(<%=id %>)님의 장바구니</h4>
  <table class="table table-striped">
    <tr>
       <th><input type="checkbox" id="allcheck"></th>
       <th>상품정보</th>
       <th>상품금액</th>
    </tr>
    
    <%
      for(int i=0;i<list.size();i++)
      {
    	  HashMap<String,String> map=list.get(i);
    	  
    	  //cnt
    	  int cnt=Integer.parseInt(map.get("cnt"));
    	  //price
    	  int price=Integer.parseInt(map.get("price"));
    	  
    	  %>
    	  
    	  <tr>
    	    <td>
    	      <input type="checkbox" name="idx" class="idx"
    	      idx="<%=map.get("idx") %>">
    	    </td>
    	    <td>
    	      <div class="sanginfo" shopnum="<%=map.get("shopnum") %>">
    	        <img alt="" src="shopsave/<%=map.get("photo")%>"
    	        class="photo"   align="left" hspace="20">
    	        <h6>상품명: <%=map.get("sangpum") %></h6>
    	        <h6>갯수: <%=cnt %></h6>
    	        <h6>날짜: <%=map.get("cartday") %></h6>
    	      </div>
    	    </td>
    	    
    	    <td>
    	       <h6>
    	       <%
    	       		price*=cnt;
    	            totmoney+=price;
    	       %>
    	       <%=nf.format(price)%>
    	         &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    	         <b><i class="bi bi-trash3 del"  idx="<%=map.get("idx") %>"
    	          style="font-size: 12pt; font-weight: bold; color: red;"></i></b>
    	       </h6>
    	    </td>
    	    
    	    
    	  </tr>
      <%}
    
    %>
    
    <tr>
      <td colspan="4">
        <button type="button"
        class="btn btn-danger" style="margin-left: 100px;"
        id="btncartdel">선택상품삭제</button>
        
        <span style="color: green; float: right; font-size: 1.5em;">
        총 주문금액:<%=nf.format(totmoney) %> <b >
        
        </b></span>
      </td>
    </tr>
   
  </table>
</div>
</body>
</html>