package day0326;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class ShopList extends JFrame{

	Container cp;
	ShopDbModel db=new ShopDbModel();
	JTable table;
	DefaultTableModel model;
	Vector<ShopDto> list;
	//생성자
	public ShopList(String title) {
		super(title); 
		
		//위치 너비
		this.setBounds(100, 100, 700, 500);
		
		cp=this.getContentPane();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		initDesign();
		this.setVisible(true);
	}
	public void initDesign() {
		this.setLayout(null);
		list=db.getAllSangpums();
		//table
		String title[] = {"No.","상품명","수량","단가","총금액","구입일"};
		model=new DefaultTableModel(title,0);
		table=new JTable(model);
		JScrollPane js=new JScrollPane(table);
		js.setBounds(20, 20, 500, 400);
		this.add(js);
		dataWrite();
		
		//익명내부 클래스(mouseadapter)
		table.addMouseListener(new MouseAdapter() {
			
		});
	}
	//리스트의 데이타를 추가
	public void dataWrite() {
		//테이블의 기존 데이타 삭제
		model.setRowCount(0);
		//테이블에 추가
		for(ShopDto dto:list) {
			Vector<String> data=new Vector<String>();
			data.add(dto.getNum());
			data.add(dto.getSangpum());
			data.add(String.valueOf(dto.getSu()));           //su dan은 숫자라 valueof
			data.add(String.valueOf(dto.getDan()));
			data.add(String.valueOf(dto.getSu()*dto.getDan()));
			data.add(String.valueOf(dto.getGuipday()));    //날짜라 String 으로 변형
			
			//테이블모델에 추가
			model.addRow(data);
		}
	}
	//이미지를 위한 내부 클래스
	
	
	/*public static void main(String[] args) {
		// TODO Auto-generated method stub
    
		new ShopList("SHOPList");
	}
*/
}
