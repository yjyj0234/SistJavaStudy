<%@page import="data.dao.guestAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<!-- 댓글삭제 ajax 이용
	내 댓글에서 버튼 클릭시 삭제됨
	성공했을 시 새로고침  location.reload(); -->
	<%
		String idx=request.getParameter("idx");
		guestAnswerDao dao=new guestAnswerDao();
		
		dao.deleteGuestAnswer(idx);
	%>
