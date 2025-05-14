package hoewon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class hoewonDao {
	DbConnect db=new DbConnect();
	
	//아이디가 존재하면 true 리턴
	public boolean isIdCheck(String id) {
		boolean b=false;  //있을경우만 true변경
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from hoewon where mid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
				if(rs.next()){
					b=true;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return b;
	}
	public void insertHoewon(hoewonDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into hoewon values(null,?,?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getHp());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public List<hoewonDto> getAllDatas() {
		List<hoewonDto> list=new ArrayList<hoewonDto>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from hoewon order by num desc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				hoewonDto dto=new hoewonDto();
				
				dto.setNum(rs.getString("num"));
				dto.setMid(rs.getString("mid"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
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
	//비밀번호 맞으면 삭제
	public boolean isPassCheck(String num, String pass) {
		boolean check=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from hoewon where num=? and pass=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)==1) {
					check=true;  //비번이 틀릴경우 0, 초기값 false이므로 굳이 else안함
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
	public void deleteHoewon(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from hoewon where num=?";
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
	//아이디에 해당하는 이름 리턴
	public String getHoewonName(String id) {
		String name="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select name from hoewon where mid=?";
		
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
	// 아이디와 비번을 인자로 받아서 해당 아이디와 같을 경우 반환 int
	//아이디와 비번이 모두 맞는 경우 1
	//아이디는 있으나 비번이 틀린 경우 2
	//아이디자체가 없는 경우 3
	
	public int getLogin(String id, String pass) {
		int idx=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from hoewon where mid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				//비번비교
				if(rs.getString("pass").equals(pass)) {
					idx=1;
				}else {
					idx=2;
				}
					
			}else {
				idx=3; //false인 경우는 해당아이디가 없는 경우
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return idx;
	}
	
}
