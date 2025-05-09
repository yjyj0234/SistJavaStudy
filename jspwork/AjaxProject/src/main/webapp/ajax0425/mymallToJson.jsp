<%@page import="oracle.db.DbConnect"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	DbConnect db=new DbConnect();
    	Connection conn=db.getConnection();
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	
    	String sql="select * from mymall order by num";
    	
    	try{
    		pstmt=conn.prepareStatement(sql);
        	rs=pstmt.executeQuery();
			
        	//web-inf 에 추가한 json.jar 파일
        	JSONArray arr=new JSONArray();
        	
        	while(rs.next()){
        		String num=rs.getString("num");
        		String sangpum=rs.getString("sangpum");
        		String color=rs.getString("color");
        		String price=rs.getString("price");
        		String imagename=rs.getString("imagename");
        				
        		JSONObject ob=new JSONObject();
        		
        		//rs로 읽어온게 value
        		ob.put("num", num);
        		ob.put("name", sangpum);
        		ob.put("color", color);
        		ob.put("price", price);
        		ob.put("imagename", imagename);
        		
        		//arr에 추가
        		arr.add(ob);
        	}%>
        	<%=arr.toString() %>
    	<%}catch(SQLException e){
    			
    	}finally{
    		db.dbClose(rs, pstmt, conn);
    	}
    	
    %>
    
    