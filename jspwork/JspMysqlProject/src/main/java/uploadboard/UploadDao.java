package uploadboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mymall.MymallDto;
import mysql.db.DbConnect;

public class UploadDao {
	
	DbConnect db=new DbConnect();
	
	public void insertBoard(UploadDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into uploadboard values(null,?,?,?,?,?,0,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImgname());
			pstmt.setString(5, dto.getPass());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public List<UploadDto> getAllDatas(){
			List<UploadDto> list=new ArrayList<UploadDto>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			//전체리스트 num 내림차순
			String sql="select * from uploadboard order by num desc";

			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					UploadDto dto=new UploadDto();
					dto.setNum(rs.getString("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setImgname(rs.getString("imgname"));
					dto.setPass(rs.getString("pass"));
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
	//페이징처리
			//1.전체갯수반환
			public int getTotalCount()
			{
				int total=0;
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select count(*) from uploadboard";
				
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					if(rs.next())
						total=rs.getInt(1); //1번열
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(rs, pstmt, conn);
				}
				
				
				return total;
			}
			
			//2.부분조회 (startNum부터 perPage 갯수만큼)
			public List<UploadDto> getPagingList(int startNum,int perPage)
			{
				List<UploadDto> list=new ArrayList<UploadDto>();
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select * from uploadboard order by num desc limit ?,?";
				
				try {
					pstmt=conn.prepareStatement(sql);
					
					//바인딩
					pstmt.setInt(1, startNum);
					pstmt.setInt(2, perPage);
					
					rs=pstmt.executeQuery();
					
					while(rs.next())
					{
						UploadDto dto=new UploadDto();
						
						dto.setNum(rs.getString("num"));
						dto.setWriter(rs.getString("writer"));
						dto.setSubject(rs.getString("subject"));
						dto.setContent(rs.getString("content"));
						dto.setImgname(rs.getString("imgname"));
						dto.setReadcount(rs.getInt("readcount"));
						dto.setWriteday(rs.getTimestamp("writeday"));
						
						list.add(dto);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				return list;
			}
			
	//조회수 1증가하는 메서드
	public void updateReadCount(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update uploadboard set readcount=readcount+1 where num=?";
		
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
	//num에 대한 dto반환
	public UploadDto getData(String num) {
		UploadDto dto=new UploadDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from uploadboard where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);

			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImgname(rs.getString("imgname"));
				dto.setPass(rs.getString("pass"));
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
	//삭제 전 비밀번호 일치 여부 확인(num과 pass를 받아서 pass 일치하면 true, 아니면 false)
	public boolean isEqualPass(String num,String pass) {
		boolean b=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//일치하는지에 대한 갯수 조회
		String sql="select count(*) from uploadboard where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				//비밀번호가 맞는경우
				if(rs.getInt(1)==1) {
					b=true;
				}//초기값이 false이므로 0인경우 자동 false(전달 따로 안해도 됨)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}		
		return b;
	}
	//수정..제목,내용,이미지 정도 수정하는 걸로......
	
	//삭제
	public void deleteUpload(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from uploadboard where num="+num;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public void updateUpload(UploadDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update uploadboard set subject=?,content=?,imgname=? where num=? and pass=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImgname());
			pstmt.setString(4, dto.getNum());
			pstmt.setString(5, dto.getPass());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
