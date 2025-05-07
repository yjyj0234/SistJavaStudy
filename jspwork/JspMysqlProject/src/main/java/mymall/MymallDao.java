package mymall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class MymallDao {
	DbConnect db= new DbConnect();
//	전체 데이터 조회
	public List<MymallDto> getAllSangPums() {
		List<MymallDto> list=new Vector<MymallDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from mymall order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MymallDto dto=new MymallDto();
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setColor(rs.getString("color"));
				dto.setPrice(rs.getInt("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getTimestamp("writeday"));
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
//	insert
	public void insertMymall(MymallDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		//mysql에서 시퀀스 부분은 null로 하면 된다
		String sql="insert into mymall values (null,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getColor());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getIpgoday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
//num에 대한 dto 반환 메서드 작성
	public MymallDto getOneDetails(String num) {
		MymallDto dto=new MymallDto();	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from mymall where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setColor(rs.getString("color"));
				dto.setPrice(rs.getInt("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setPhoto(rs.getString("photo"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
}
