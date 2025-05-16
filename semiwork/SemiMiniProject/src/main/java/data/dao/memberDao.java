package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.memberDto;
import mysql.db.DbConnect;

public class memberDao {
	DbConnect db=new DbConnect();
	
	//아이디 체크
	public int isIdCheck(String id) {
		int isId=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) { //해당아이디 존재하면 1, 아님0
				/*if(rs.getInt(1)==1)
				 * isId=1;
				 */
				isId=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isId;
	}
	//아이디에 따른 이름 반환
	 public String getName(String id) {
		String name="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name=rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		 
		 return name;
	 }
	 public void insertMember(memberDto dto) {
		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		
		 String sql="insert into member values(null,?,?,?,?,now())";
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getEmail());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	 //memberDao에 전체멤버목록 출력 메서드
	 public List<memberDto> getAllMembers(){
		List<memberDto> list=new ArrayList<memberDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member order by num";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				memberDto dto=new memberDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
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
	 //num에 대한 dto반환
	 public memberDto getData(String num) {
		 memberDto dto=new memberDto();
		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
				
		 String sql="select * from member where num=?";
		 try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		 return dto;
	 }
	 //비밀번호 체크
	 public boolean isPassCheck(String num, String pass) {
		 boolean check=false;
		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 String sql="select count(*) from member where num=? and pass=?";
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)==1) {
					check=true;  //비번이 틀릴경우 0, 초기값이 false라서 굳이 else안해도됨
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		 return check;
	 }
	 //삭제
	 public void deleteMember(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from member where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	 //수정
}
