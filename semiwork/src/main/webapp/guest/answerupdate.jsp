<%@page import="data.dto.guestAnswerDto"%>
<%@page import="data.dao.guestAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
    String content=request.getParameter("content");
  	String idx=request.getParameter("idx");
  	
  	guestAnswerDao dao=new guestAnswerDao();
  	guestAnswerDto dto=new guestAnswerDto();
  	
  	dto.setContent(content);
  	dto.setIdx(idx);  	
  	
  	dao.updateGuestAnswer(dto);
  	
   %>
  