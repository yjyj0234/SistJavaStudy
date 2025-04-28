<%@page import="ajaxmemo.MemoDto"%>
<%@page import="ajaxmemo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemoDao dao=new MemoDao();
	
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String emot=request.getParameter("emot");
	String num=request.getParameter("num");
	
	MemoDto dto=new MemoDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setEmot(emot);
	dto.setNum(num);
	
	dao.deleteDao(dto);
	
%>
