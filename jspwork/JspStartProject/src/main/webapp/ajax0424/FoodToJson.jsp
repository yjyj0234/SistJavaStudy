<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DbConnect db= new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from yogoyo order by food_no";
	String dish="[";
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			
			int num=rs.getInt("food_no");
			String food_name=rs.getString("food_name");
			String food_photo=rs.getString("food_photo");
			int price=rs.getInt("price");
			int cnt=rs.getInt("cnt");
			
			dish+="{";
			dish+="\"num\":"+num+",\"name\":\""+food_name+"\",\"price\":"+price;
			dish+=",\"count\":"+cnt+",\"image\":\""+food_photo+"\"";
			dish+="},";
			
		}
		dish=dish.substring(0,dish.length()-1);
		
	}catch(SQLException e){
		
	}db.dbClose(rs, pstmt, conn);
	dish+="]";
%>
<%=dish %>