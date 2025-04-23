package Car;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;

public class CarMain extends JFrame implements ActionListener{
	DbConnect db=new DbConnect();
	CarImage ci=new CarImage();
	DefaultTableModel model;
	JTable table;
	Container cp;
	JButton btn1,btn2, btn3;
	int selectRow=-1;
	//생성자
	public CarMain(String title) {
		super(title);
		
		//위치,너비
		this.setBounds(200, 100, 1300, 700);
		setContentPane(new JLabel(new ImageIcon("images/main.png")));  //배경 이미지 넣기
		cp=this.getContentPane();
		
		//메인프레임 종료
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//창 색상
			
		initDesign();
		
		this.setVisible(true);	
	}
	
	public void initDesign()
	{
		this.setLayout(null);
		
		ci.carImage();
		ci.setBounds(50, 50, 780, 550);	
		ci.setBorder(new LineBorder(Color.black,4));
		
		
		this.add(ci);
		
		//자동차 버튼 사이 선
		JPanel linePanel=new JPanel();
		linePanel.setBounds(900, 0, 5, 700);
		linePanel.setBackground(new Color(255,255,255));
		this.add(linePanel);
		
		//버튼 2개
		btn1 = new JButton("전체 구매 고객 조회");
		btn1.setFont(new Font("", Font.BOLD, 20));
		btn1.setBounds(980, 150, 250, 80);
		btn1.addActionListener(this);
		this.add(btn1);
		
		
		btn2 = new JButton("기존 고객 데이터 삭제");
		btn2.setFont(new Font("", Font.BOLD, 18));
		btn2.setBounds(980, 270, 250, 80);
		btn2.addActionListener(this);
		this.add(btn2);
		
		btn3 = new JButton("기존 고객 데이터 수정");
		btn3.setFont(new Font("", Font.BOLD, 18));
		btn3.setBounds(980, 390, 250, 80);
		btn3.addActionListener(this);
		this.add(btn3);
		
	}
	
	
	//삭제
	public void deleteCar(String car_no) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		int n=0;
		String sql="delete from car where car_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, car_no);
			n=pstmt.executeUpdate();
			
			if(n==0) {
				JOptionPane.showMessageDialog(this, "없는 번호입니다");
			}else {
				JOptionPane.showMessageDialog(this, "삭제되었습니다");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}db.dbClose(pstmt, conn);
	}
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		if(ob==btn1) {
			CarSelect cars=new CarSelect("전체 구매 고객 조회");
			cars.setVisible(true);
		}else if(ob==btn2) {
			String car_no=JOptionPane.showInputDialog("삭제할 차량등록번호를 입력하세요");
			deleteCar(car_no);
		}
		else if(ob==btn3)
		{
			CarSelect cselect=new CarSelect(getTitle());
			for(int i=0; i<cselect.table.getRowCount();i++)
			{
				cselect.table.addMouseListener(new MouseAdapter() {
					@Override
					public void mouseClicked(MouseEvent e) {
						// TODO Auto-generated method stub
						super.mouseClicked(e);
						selectRow=table.getSelectedRow();
						CarUpdate cUpdate=new CarUpdate("업데이트 폼");
						
					}
				});
			}
		}
	}
	public static void main(String[] args) {
		new CarMain("자동차 스윙");
		
	}

}