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
</head>
<body>
	<h3 class="alert alert-info">3번째 예제 출력</h3>
	<br>
	<h4>메뉴이름을 입력 후 엔터를 눌러주세요</h4>
	<input type="text" id="search" class="form-control" style="width: 150px;">
	<br><br>
	<h2 id="foodname"></h2>
	<br>
	<img alt="" src="" id="photo" width="300">
	
	<script type="text/javascript">
		//메뉴명 입력후 엔터누를때 출력하기
		/* 받은 name값이 있으므로 데이터에 name 넘기기 */
		$("#search").keyup(function(e){
			if(e.keyCode==13){
				var name=$(this).val();
				$.ajax({
					type:"get",
					dataType:"json",
					url:"list3",
					data:{"name":name},
					success:function(res){
						$("#foodname").append(res.name);
							$("#photo").attr("src","image/Food/"+res.photo);
					}
				});
			}	
		});
	</script>
</body>
</html>