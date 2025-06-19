<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <!-- 여기는 디자인이라 새로고침만 해주면 됨 -->
<%--
<h1>여기는 result1.jsp입니다<br>
HelloController로부터 포워드</h1>
<b>이름 : ${name }</b><br>
<!-- requestScope는 생략 가능 -->
<b>이름 : ${requestScope.name }</b><br>
<b>주소 : ${addr }</b><br>
<b>주소 : ${requestScope.addr }</b><br>
 --%>
 <h2>매핑주소연습</h2>
 <ul>
 	<li><a href="sist/list">A</a></li>
 	<li><a href="sist/list.do">B</a></li>
 	<li><a href="sist/list.nhn">C</a></li>
 	<li><a href="apple/insert">자바 점수와 스프링 점수를 result2에 출력하시오</a></li>
 	<li><a href="samsung/dragon">ModelAndView로 result3로 이동</a></li>
 	<li><a href="naver/board">본인나이와 사는지역을 저장_HappyController에 만든 후 result4에서 출력</a></li>
 </ul>
 <h2>이미지 출력연습</h2>
 <ul>
 	<li><a href="shop/detail">resources의 이미지 출력_result5</a></li>
 </ul>
 
 <h2>Quiz<br>
  1. title 이라는 이름으로 h2태그로 이미지 출력과제라고 출력하세요<br>
 		  2. 학생명도 stuName으로 저장할 것
 		  _quiz1.jsp에 출력</h2>
 	<ul>
 		<a href="quiz/lunch/burger">
 			QuizController 만드시고 자유롭게 quiz1으로 이동하신 후 이미지를 출력
 			이미지는 리소스 2개 이상
 			WEB-INF에 있는 이미지 2개이상
 		</a>
 	</ul>
 	
 	<h2>복습</h2>
 	<ul>
 		<li><a href="nice/hi">복습1</a></li>
 		<li><a href="happy">복습2</a></li>
 	</ul>
 	
</body>
</html>