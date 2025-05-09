<%@page import="oracle.db.DbConnect"%>
<%@page import="java.sql.SQLException"%>
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
		
		String sql="select * from info order by num";
		//json 양식이 [{},{},{}] 식이라 마지막 {} 이후엔 ,가 없으므로 ,빼줘야함
		//json 의 [ 부분
		String s="[";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				String num=rs.getString("num");
				String name=rs.getString("name");
				String hp=rs.getString("hp");
				int age=rs.getInt("age");
				String photo=rs.getString("photo");
				
				s+="{";
				s+="\"num\":"+num+",\"name\":\""+name+"\",\"hp\":\""+hp+"\",\"age\":"+age+",\"photo\":\""+photo+"\"";
				s+="},";
				
			}
			//마지막 컴마 제거(처음부터 마지막 전 글자 까지만 리턴)
			s=s.substring(0, s.length()-1);
			
		}catch(SQLException e){
			
		}finally{
			db.dbClose(rs, pstmt, conn);
		}
		s+="]";
	%>
	<%=s %>
