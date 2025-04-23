package hello;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	//전체 리스트 출력
	public ArrayList<HelloDto> getAllHelloDatas() {
		ArrayList<HelloDto> list =new ArrayList<HelloDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from hellojsp order by num";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//여러개의 데이터는 while, 하나는 if문
			while(rs.next()) {
				//while 문 안에서 dto선언
				HelloDto dto=new HelloDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setHp(rs.getString("hp"));
				dto.setCurdate(rs.getTimestamp("curdate"));
				
				//벡터에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	//수정에 필요한 하나의 데이터_num
	public HelloDto getOneData(String num) {
		
		HelloDto dto=new HelloDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from hellojsp where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			//수정하려는 하나의 데이터 
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setHp(rs.getString("hp"));
				dto.setCurdate(rs.getTimestamp("curdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//수정
	public void updateHello(HelloDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update hellojsp set name=?,addr=?,hp=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public void deleteHello(HelloDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from hellojsp where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
