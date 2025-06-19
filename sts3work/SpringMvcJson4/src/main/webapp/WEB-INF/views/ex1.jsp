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
	<h3 class="alert alert-info">ex1 예제</h3>
	<br>
	<button type="button" id="btn1" class="btn btn-danger">Json데이터</button>
	<div id="out1"></div>
	
	<script type="text/javascript">
		$("#btn1").click(function(){
			$.ajax({
				type:"get",
				dataType:"json",
				url:"list1",
				success:function(res){
					$("#out1").empty();
					$("#out1").append("이름: "+res.name+"<br>");
					$("#out1").append("전화번호: "+res.hp+"<br>");
					$("#out1").append("주소: "+res.addr+"<br>");
				}
			});
			
		});
	</script>
</body>
</html>