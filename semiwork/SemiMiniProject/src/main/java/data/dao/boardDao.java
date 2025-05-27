package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.boardDto;
import mysql.db.DbConnect;

public class boardDao {
	DbConnect db=new DbConnect();
	
	//num의 max값 구해서 리턴(null일 경우 0으로 리턴)
	public int getMaxNum() {
		int max=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//맥스값 구하는 sql(null이면 null 대신 0출력)
		//얼리어스 max로 수정 
		String sql="select ifnull(max(num),0) max from coffee.reboard";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				max=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return max;
	}
	//데이터 추가시 같은 그룹 중에서 전달받은 step 보다 큰 값을 가진 데이터들은
	//무조건 restep+1 해준다
	public void updateRestep(int regroup,int restep) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update coffee.reboard set restep=restep+1 where regroup=? and restep>?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regroup);
			pstmt.setInt(2, restep);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//insert:새 글로 추가할지 답글로 추가할지
	//판단:dto의 num이 null이면 새글로 아니면 답글로 insert할 것
	public void insertReboard(boardDto dto) {
		
		String num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		String sql="insert into coffee.reboard(writer,subject,content,pass,regroup,restep,relevel,writeday) values(?,?,?,?,?,?,?,now())";
		if(num==null) {
			//새글을 의미
			regroup=this.getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {
			//답글을 의미
			//같은 그룹중에서 restep이 전달받은 값보다 큰 경우 무조건 1씩 증가
			this.updateRestep(regroup, restep);
			
			//전달받은 level,step 1씩증가
			relevel+=1;
			restep++;
		}
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPass());
			pstmt.setInt(5, regroup);
			pstmt.setInt(6, restep);
			pstmt.setInt(7, relevel);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	//디테일 페이지(num에 대한 하나의 dto)
	public boardDto getData(String num) {
		boardDto dto= new boardDto();
		
		String sql="select * from coffee.reboard where num=?";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setRegroup(rs.getInt("regroup"));
				dto.setRestep(rs.getInt("restep"));
				dto.setRelevel(rs.getInt("relevel"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//조회수
	public void updateReadCount(String num) {
		String sql="update coffee.reboard set readcount=readcount+1 where num=?";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
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
	
	//전체목록
	public List<boardDto> getAllDatas(){
		List<boardDto> list=new ArrayList<boardDto>();
		//그룹변수 내림차순 같은그룹인 경우 step의 오름차순 정렬
		String sql="select * from coffee.reboard order by regroup desc,restep asc";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				boardDto dto =new boardDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegroup(rs.getInt("regroup"));
				dto.setRestep(rs.getInt("restep"));
				dto.setRelevel(rs.getInt("relevel"));
				dto.setReadcount(rs.getInt("readcount"));
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
	//비번체크_맞으면 true
	public boolean isEqualPass(String num,String pass) {
		boolean flag=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from coffee.reboard where num=? and pass=?";
				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, num);
					pstmt.setString(2, pass);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						if(rs.getInt(1)==1)
							flag=true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(rs, pstmt, conn);
				}
		return flag;
	}
	//삭제
	public void deleteBoard(String num) {
		String sql="delete from coffee.reboard where num=?";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
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
	//원글이 있는지?
	//삭제하는데 원글이 삭제된 경우 답글의 맨앞에 [원글이 삭제된 답글]로 출력하기위함
	public boolean isGroupStep(int regroup) {
		boolean flag=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//restep은 보통 기본값
		 String sql="select * from coffee.reboard where regroup=? and restep=0";
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regroup);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//갯수반환을 해서 갯수가 1이면 true로 쓰지만 여기선 count를 안썼기때문에
				//데이터가 존재하기만하면 true로 줌
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		 return flag;
	}
}