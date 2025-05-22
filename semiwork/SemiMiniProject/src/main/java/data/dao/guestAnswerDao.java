package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.guestAnswerDto;
import data.dto.guestDto;
import mysql.db.DbConnect;

public class guestAnswerDao {
	DbConnect db=new DbConnect();
	
	public void insertGuestAnswer(guestAnswerDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into coffee.guestanswer values(null,?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public List<guestAnswerDto> getAllGuestAnswers(String num){
		List<guestAnswerDto> list=new ArrayList<guestAnswerDto>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		String sql="select * from coffee.guestanswer where num=? order by idx";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				guestAnswerDto dto=new guestAnswerDto();
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
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
	
	public void deleteGuestAnswer(String idx) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from coffee.guestanswer where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//idx에 대한 dto
	public String getData(String idx) {
		//수정할게 하나밖에 없어서 따로 dto안불러도 됨
		String content="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select content from coffee.guestanswer where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				content=rs.getString("content");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
				
		return content;
	}
	//수정
	public void updateGuestAnswer(guestAnswerDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update coffee.guestanswer set content=? where idx=?";
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getIdx());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	
	}
}
