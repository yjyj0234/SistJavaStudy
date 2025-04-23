package day0326;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import day0319.DbConnect;

public class ShopDbModel {
	
	DbConnect db=new DbConnect();
	
	//추가
	public void insertShop(ShopDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into Shop values(seq_test.nextval,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//4개 순서대로 바인딩
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getSu());
			pstmt.setInt(4,dto.getDan());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	//조회
    	//  가변형의 리스트를 리턴한다
	public Vector<ShopDto> getAllSangpums() {
		Vector<ShopDto> list=new Vector<ShopDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from shop order by sangpum";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//db에서 하나씩의 레코드를 읽어서 dto에 담는다
				ShopDto dto=new ShopDto();
				
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setSu(rs.getInt("su"));
				dto.setDan(rs.getInt("dan"));
				dto.setGuipday(rs.getDate("guipday"));
				
				//리스트에 dto추가
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}db.dbClose(rs, pstmt, conn);
		
		return list;
	}	
	//삭제..시퀀스 받아서 삭제하는 메서드
	public int deleteShop(int num) {
		
		int n=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from shop where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			n=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		return n;
	}
	
	//수정하려는 하나의 dto를 반환하는 메서드(dto: 등록된 정보 1세트(num sangpum photo, su dan guipday)당 1개)
	public ShopDto getOneSangpum(String num) {
		ShopDto dto=new ShopDto();
		String sql="select * from shop where num=?";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setSu(rs.getInt("su"));
				dto.setDan(rs.getInt("dan"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	//업데이트
	public void updateShop(ShopDto dto) {
		String sql="update shop set sangpum=?,su=?,dan=?,photo=? where num=?";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSangpum());
			pstmt.setInt(2, dto.getSu());
			pstmt.setInt(3, dto.getDan());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}db.dbClose(pstmt, conn);
	}
	
}
