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
 <!-- ����� �������̶� ���ΰ�ħ�� ���ָ� �� -->
<%--
<h1>����� result1.jsp�Դϴ�<br>
HelloController�κ��� ������</h1>
<b>�̸� : ${name }</b><br>
<!-- requestScope�� ���� ���� -->
<b>�̸� : ${requestScope.name }</b><br>
<b>�ּ� : ${addr }</b><br>
<b>�ּ� : ${requestScope.addr }</b><br>
 --%>
 <h2>�����ּҿ���</h2>
 <ul>
 	<li><a href="sist/list">A</a></li>
 	<li><a href="sist/list.do">B</a></li>
 	<li><a href="sist/list.nhn">C</a></li>
 	<li><a href="apple/insert">�ڹ� ������ ������ ������ result2�� ����Ͻÿ�</a></li>
 	<li><a href="samsung/dragon">ModelAndView�� result3�� �̵�</a></li>
 	<li><a href="naver/board">���γ��̿� ��������� ����_HappyController�� ���� �� result4���� ���</a></li>
 </ul>
 <h2>�̹��� ��¿���</h2>
 <ul>
 	<li><a href="shop/detail">resources�� �̹��� ���_result5</a></li>
 </ul>
 
 <h2>Quiz<br>
  1. title �̶�� �̸����� h2�±׷� �̹��� ��°������ ����ϼ���<br>
 		  2. �л��� stuName���� ������ ��
 		  _quiz1.jsp�� ���</h2>
 	<ul>
 		<a href="quiz/lunch/burger">
 			QuizController ����ð� �����Ӱ� quiz1���� �̵��Ͻ� �� �̹����� ���
 			�̹����� ���ҽ� 2�� �̻�
 			WEB-INF�� �ִ� �̹��� 2���̻�
 		</a>
 	</ul>
 	
 	<h2>����</h2>
 	<ul>
 		<li><a href="nice/hi">����1</a></li>
 		<li><a href="happy">����2</a></li>
 	</ul>
 	
</body>
</html>