package Car;
import java.awt.Color;
import java.awt.Container;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class CarSelect extends JFrame{
	DbConnect db=new DbConnect();
	Container cp;
	DefaultTableModel model;
	JTable table;
	
	//생성자
	public CarSelect(String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(100, 100, 1000, 500);
		
		cp=this.getContentPane();
	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		Initdesign();
		this.setVisible(true);
	}
	public void Initdesign() {
		String [] title= {"차량등록번호","차종","색상","옵션","가격","주문번호","성명","주소","전화번호","국적"};
		model=new DefaultTableModel(title,0);
		table=new JTable(model);
		addData();
		JScrollPane js=new JScrollPane(table);
		js.setBounds(20, 20, 1000, 400);
		this.add(js);
	}
	public void addData() {
		//테이블의 기존 데이터 삭제
		model.setRowCount(0);
		
			Connection conn=db.getConnection();
			model.setRowCount(0);
			
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select c.car_no, car_model, car_color,car_option,"
					+ "car_price, order_no, order_name, order_addr,order_hp,"
					+ "order_nationality from orderer o,car c where o.car_no=c.car_no order by o.car_no";
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Vector<Object> data=new Vector<Object>();
					data.add(rs.getInt("car_no"));
					data.add(rs.getString("car_model"));
					data.add(rs.getString("car_color"));
					data.add(rs.getString("car_option"));
					data.add(rs.getInt("car_price"));
					data.add(rs.getInt("order_no"));
					data.add(rs.getString("order_name"));
					data.add(rs.getString("order_addr"));
					data.add(rs.getString("order_hp"));
					data.add(rs.getString("order_nationality"));
					model.addRow(data);

				}				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
		}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
    
		//new CarSelect("전체 구매 인원 조회");
	}

}