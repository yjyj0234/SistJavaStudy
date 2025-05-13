<%@page import="org.json.simple.JSONObject"%>
<%@page import="uploadboard.UboardAnswerDto"%>
<%@page import="uploadboard.UboardAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String idx=request.getParameter("idx");
	UboardAnswerDao dao=new UboardAnswerDao();
	UboardAnswerDto dto=dao.getAnswerData(idx);
	
	JSONObject ob=new JSONObject();
	
	ob.put("idx", dto.getIdx());
	ob.put("nick", dto.getNickname());
	ob.put("content", dto.getContent());
	
%>
<%=ob.toString()%>