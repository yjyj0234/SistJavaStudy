<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id=request.getParameter("id");
	memberDao dao=new memberDao();
	int count=dao.isIdCheck(id);
	
	JSONObject ob=new JSONObject();
	
	//key값:count
	ob.put("count", count);
	
%>
<%=ob.toString() %>
