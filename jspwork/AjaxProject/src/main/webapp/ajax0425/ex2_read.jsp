<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("sang_name");
String code=request.getParameter("sang_code");
String color=request.getParameter("color");
String price=request.getParameter("sang_price");

	JSONObject ob=new JSONObject();
	ob.put("code",code);
	ob.put("name",name);
	ob.put("color",color);
	ob.put("price",price);
	
	
%>
<%=ob.toString() %>