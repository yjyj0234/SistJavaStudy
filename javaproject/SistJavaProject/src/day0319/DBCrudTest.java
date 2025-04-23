package day0319;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBCrudTest {

	DbConnect db=new DbConnect();
	
		
	public void insert()
	{
		Scanner sc=new Scanner(System.in);
		
		String name,addr;
		String sql="";
		
		System.out.println("이름입력");
		name=sc.nextLine();
		System.out.println("주소입력");
		addr=sc.nextLine();
		
		sql="insert into hello values (seq_test.nextval,'"+name+"','"+addr+"',sysdate)";
		System.out.println(sql);
		
		
		Connection conn=null;
		Statement stmt=null;
		
		//1.db연결
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			stmt.execute(sql); //boolean or int 저장할지...
			
			System.out.println("**추가됨**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	public void select()
	{
		System.out.println("시퀀스\t이름\t주소\t가입일자");
		System.out.println("===========================================");
		
		String sql="select * from hello order by num";
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			//executeQuery메서드를 이용해서 결과를 ResultSet객체로 얻는다
			rs=stmt.executeQuery(sql);
			
			//2개이상일때는 while, 하나일때는 if
			while(rs.next())
			{
				//ResultSet next를 이용해서 행을 선택하고 get메서드를 이용해서 테이블의 컬럼값을 얻는다
				System.out.println(rs.getInt("num")+"\t"
				+rs.getString("name")+"\t"
				+rs.getString("addr")+"\t"
				+rs.getDate("sdate"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {


			
		}
		
		
	}
	
	//삭제_메인에서 삭제할 번호는 ? 1 1번만 삭제되는걸로
	public void delete()
	{
		Scanner sc=new Scanner(System.in); 
		int num;
		String sql="";
		
		System.out.println("삭제할 번호는?");
		num=Integer.parseInt(sc.nextLine());
		
		sql="delete from hello where num="+num;
		//System.out.println(sql);
		
		//db연결
		Connection conn=db.getConnection();
		//statement
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);  //성공한레코드의 갯수
			
			//없는 번호 입력시 실제 삭제가 안되므로 0이반환
			if(a==0)
				System.out.println("없는 데이타 번호입니다");
			else //삭제되면 1이반환
				System.out.println("**삭제되었습니다**");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
		
		
	}
	
	//수정할 하나의 데이터 조회
	public boolean isData(int num)
	{
		//num에 해당하는 데이타가 있으면 true,없으면 false반환
		
		boolean flag=false;
		
		String sql="select * from hello where num="+num;
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			//1개일경은 if
			if(rs.next()) //데이타가 있는경우
				flag=true; 
			else  //데이타가 없는경우
				flag=false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
		
		
		return flag;
		
	}
	
	
	
	
	//수정_수정하고 싶은 번호를 입력해서 이름과 주소를 수정
	public void update()
	{
		Scanner sc=new Scanner(System.in);
		String name,addr;
		int num;
		
		System.out.println("수정할 번호 입력하시오");
		num=Integer.parseInt(sc.nextLine());
		
		if(!this.isData(num))
		{
			System.out.println("해당번호는 존재하지 않습니다");
			return; //메서드 종료
		}
		
		
		
		System.out.println("수정할 이름을 선택하시오");
		name=sc.nextLine();
		System.out.println("수정할 주소를 선택하시오");
		addr=sc.nextLine();
		
		String sql="update hello set name='"+name+"',addr='"+addr+"' where num="+num;
		System.out.println(sql);
		
		//db연결
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);
			
			if(a==0)
				System.out.println("수정할 데이타가 존재하지않습니다");
			else
				System.out.println("**수정이 완료되었습니다**");
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
		
		
		
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        DBCrudTest db=new DBCrudTest();
        
        Scanner sc=new Scanner(System.in);
        int n;
        
        while(true)
        {
        	System.out.println("1.insert 2.select 3.update 4.delete 9.exit");
        	n=Integer.parseInt(sc.nextLine());
        	
        	if(n==1)
        		db.insert();
        	else if(n==9)
        	{
        		System.out.println("프로그램을 종료합니다");
        		break;
        	}else if(n==2)
        		db.select();
        	else if(n==4)
        		db.delete();
        	else if(n==3)
        		db.update();
        }
        
	}

}