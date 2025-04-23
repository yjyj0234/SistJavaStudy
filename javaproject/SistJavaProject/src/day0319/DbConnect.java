package day0319;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {

	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//오라클계정연결
	public Connection getConnection()
	{
		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(URL, "yjyj0345", "a1234");
			
			//System.out.println("오라클 연결 성공!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//System.out.println("오라클 연결 실패!!!");
		}
		
		return conn;
	}
	
	//close 메서드 총4개,오버로딩 메서드
	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(Statement stmt,Connection conn)
	{
		try {
			
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {
			
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}