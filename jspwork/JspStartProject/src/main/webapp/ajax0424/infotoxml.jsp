<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DbConnect"%>
									<!-- html->xml로 바꿔주기 -->
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<!-- 자바표기로 db가져오기 -->
	<%
		DbConnect db=new DbConnect();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from info order by num";
		
		//xml 에서는 try catch를 직접 타이핑해야함
		try{
			pstmt=conn.prepareStatement(sql);	
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				String num=rs.getString("num");
				String name=rs.getString("name");
				String hp=rs.getString("hp");
				int age=rs.getInt("age");
				String photo=rs.getString("photo");
				
				%>
				
				<info num="<%=num %>">
						<name><%=name %></name>
						<hp><%=hp %></hp>
						<age><%=age %></age>
						<photo><%=photo %></photo>
				</info>
			<%}
		}catch(SQLException e){
			
		}finally{
			db.dbClose(rs, pstmt, conn);
		}
		
	%>
</data>