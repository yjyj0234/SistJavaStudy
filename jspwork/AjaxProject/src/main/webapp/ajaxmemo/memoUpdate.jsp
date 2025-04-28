<%@page import="ajaxmemo.MemoDto"%>
<%@page import="ajaxmemo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemoDao dao=new MemoDao();
	MemoDto dto=new MemoDto();
	
	//파라메터 값 불러오기
	//수정폼의 num,writer,content,emot를 불러온다
	String unum=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String content=request.getParameter("ucontent");
	String emot=request.getParameter("umot");
	
	dto.setNum(unum);
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setEmot(emot);
	
	dao.updateMemo(dto);
%>

