<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


	<%
		String name=request.getParameter("name");
		String addr=request.getParameter("addr");
		
		System.out.println("name:"+name);
		System.out.println("addr:"+addr);
		
	%>
	<data>
		<name><%=name %></name>
		<addr><%=addr %></addr>
	</data>
	

