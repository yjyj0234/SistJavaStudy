package hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import oracle.db.DbConnect;

public class HelloDao {
	
	DbConnect db=new DbConnect();
	
//	insert
	
//	return 해줄게 없어서 void
	public void insertHello(HelloDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql="insert into hellojsp values(seq_hello.nextval,?,?,?,sysdate)";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			//? 순서대로 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getHp());
			
			//실행
			//pstmt.execute();
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
