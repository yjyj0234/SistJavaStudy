<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Myeongjo&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$(".list1").click(function() {
			$(this).addClass("menucolor");
			$(".list2").removeClass("menucolor");
			$.ajax({
				type : "get",
				dataType : "json",
				url : "../rest/list1",
				success : function(res) {
					var a = "";
					$.each(res, function(idx, dto) {
						a+="<table><tr><th>"
						a +=  dto.writer + "</th>";
						a+="</tr>";
						a+="</table>";
					});
					$(".contents").html(a);
				},
			});
		});
		$(".list2").click(function(){
			$(this).addClass("menucolor");
			$(".list1").removeClass("menucolor");
			$.ajax({
				type:"get",
				dataType:"json",
				url:"../rest/list1",
				success:function(res){
					var a="";
					$.each(res,function(idx,dto){
						a+="<div>"+dto.writer+"</div>";
					});
					$(".contents").html(a);
				}
			});
		});
	});
</script>
<style type="text/css">
	i{
		cursor: pointer;
		font-size: 24px;
		font-weight: bold;
	}
	.menucolor{
		color: green;
	}
</style>
</head>
<body>

	<!-- RestApi를 이용한 2개의 리스트 출력 (페이징 처리 없이 출력)
	/rest/list1 : 아이콘 클릭 시 제목이랑 내용위주의 출력(카드형)
	/rest/list2 : 아이콘 클릭 시 사진이 있는경우에만 이미지 리스트 출력(앨범형)
	
	ajax 반드시 이용해서 출력할 것
	sql,dao 전체글 출력하는 메서드 추가
	RestController 하나 만들고 이용해서 출력
	 --><div style="border: 1px solid gray; width: 1000px;">
	 <div style="border: 1px solid gray; width: 200px; float: right; text-align: top;">
		 	<i class="bi bi-view-list list1" ></i>&nbsp;&nbsp;
		 	<i class="bi bi-border-all list2"></i>
	 	</div><br><br>
	 	
	 	
	 	<div class="contents" style="border: 1px solid gray">
	 		
	 	</div>
	 </div>
	 
</body>
</html>