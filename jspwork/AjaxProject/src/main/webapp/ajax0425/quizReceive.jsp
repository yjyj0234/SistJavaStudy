<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String foodimg=request.getParameter("foodimg");
	String name=request.getParameter("foodname");
	String score1=request.getParameter("score1");
	String score2=request.getParameter("score2");
	String score3=request.getParameter("score3");
	
	int totscore=Integer.parseInt(score1)+Integer.parseInt(score2)+Integer.parseInt(score3);
	double avg=totscore/3.0;
	
	
	JSONObject ob= new JSONObject();
	
	ob.put("food", foodimg);
	ob.put("name",name);
	ob.put("total",totscore);
	ob.put("avg", avg);
	
	
%>

<%=ob.toString() %>