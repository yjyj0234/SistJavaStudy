<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.guestAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String idx=request.getParameter("idx");
	guestAnswerDao adao=new guestAnswerDao();
	
	String content=adao.getData(idx);
	
	//제이슨 형태로 바꾸기
	JSONObject ob=new JSONObject();
	ob.put("idx", idx);
	ob.put("ctnt", content);
%>
<%=ob.toString() %>
    