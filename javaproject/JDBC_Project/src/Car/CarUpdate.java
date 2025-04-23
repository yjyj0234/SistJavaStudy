package Car;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class CarUpdate extends JFrame implements ActionListener {
	Container cp;
	JLabel lblModel,lblImage;
	JRadioButton [] rbColors=new JRadioButton[2]; // 차량 색상 라디오버튼	
	JCheckBox [] cbOption=new JCheckBox[4]; //차량 옵션 체크박스
	
	String [] carColor= {"white","black"}; //차량 색상 타이틀
	String [] car_option = {"네비게이션","파노라마 썬루프","크루즈컨트롤","열선 및 통풍시트"};//옵션 타이틀
	
	JButton btnSave; //저장버튼
	JTextField tfPrice,tfName, tfAddr,tfGender, tfHp, tfNati;	//주문자 정보 입력
	ImageIcon icon;
	String car_color;
	CarMain cMain=new CarMain("메인폼");
	CarInsert cInsert=new CarInsert("입력 폼");
	CarImage ci=new CarImage();	
	DbConnect db=new DbConnect();
	String modelName, option;
	// 자동차 이미지 경로 (색상별)
    
	int selectRow=-1;
	
	//생성자
	public CarUpdate(String title) {
		super(title);
		
		//위치,너비
		this.setBounds(1000, 100, 500, 600);		
		cp=this.getContentPane();
		//메인프레임 종료
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//창 색상
		cp.setBackground(new Color(245,245,245));
		
		initDesign();
		this.setVisible(true);	
	}
	
	public void initDesign()
	{
this.setLayout(null);
		
		//라벨 모델 라벨
		lblModel=new JLabel("모델: "+modelName);
		lblModel.setBounds(10, 20, 150, 30);
		this.add(lblModel);
		
		//차량 이미지 라벨
		lblImage=new JLabel();
		lblImage.setBounds(330, 50, 450, 300);
		this.add(lblImage);
		
		
		//색상 선택
		JPanel panel1=new JPanel();
		panel1.setBorder(BorderFactory.createTitledBorder("차량 색상"));
		panel1.setBounds(10, 60, 180, 60);
		panel1.setLayout(new GridLayout(1,2));
		
		
		ButtonGroup bg=new ButtonGroup();
		for(int i=0; i< rbColors.length; i++)
		{
			rbColors[i]=new JRadioButton(carColor[i], i==0?true:false); //라디오버튼 생성
			panel1.add(rbColors[i]);// 탑패널에 2개의 라디오버튼추가
			bg.add(rbColors[i]); //버튼그룹에 2개의 버튼 추가
			
			rbColors[i].addActionListener(this); 
			this.add(panel1);
		}	      
        
        
		//옵션 패널 checkbox
		
		JPanel panel2=new JPanel();
		panel2.setLayout(new GridLayout(2,2));
		panel2.setBounds(10, 140, 300, 60);
		panel2.setBorder(BorderFactory.createTitledBorder("추가 옵션"));		
		
		for(int i=0; i<cbOption.length;i++)
		{
			cbOption[i]=new JCheckBox(car_option[i]);
			panel2.add(cbOption[i]);
			cbOption[i].addActionListener(this);	
			this.add(panel2);
		}
		
		
		
		//가격, 주문자 성함, 주소, 핸드폰번호, 국적
		JLabel lblPrice=new JLabel("가격");
		JLabel lblName= new JLabel("주문자 성함");
		JLabel lblAddr = new JLabel("주문자 주소");		
		JLabel lblHp = new JLabel("핸드폰 번호");
		JLabel lblNati =new JLabel("국적");		
		
		lblPrice.setBounds(10, 220, 80, 30);
		this.add(lblPrice);
		lblName.setBounds(10, 260, 80, 30);
		this.add(lblName);
		lblAddr.setBounds(10, 300, 80, 30);
		this.add(lblAddr);		
		lblHp.setBounds(10, 340, 80, 30);
		this.add(lblHp);
		lblNati.setBounds(10, 380, 80, 30);
		this.add(lblNati);
		
		tfPrice = new JTextField();
		tfName = new JTextField();
		tfAddr = new JTextField();		
		tfHp = new JTextField();
		tfNati =new JTextField();
		
		tfPrice.setBounds(120, 220, 100, 30);
		this.add(tfPrice);
		tfName.setBounds(120, 260, 100, 30);
		this.add(tfName);
		tfAddr.setBounds(120, 300, 100, 30);
		this.add(tfAddr);		
		tfHp.setBounds(120, 340, 100, 30);
		this.add(tfHp);
		tfNati.setBounds(120, 380, 100, 30);
		this.add(tfNati);
	
		//저장버튼
		btnSave = new JButton("주문하기");
		btnSave.setBounds(330, 350, 150, 80);
		btnSave.addActionListener(this);
		this.add(btnSave);
	}
	
	
	
	public void insertWriteData()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		ResultSet rs=null;
		
		String sql="select c.car_no, car_model, car_color, car_option, car_price, order_name, order_addr, order_hp, order_nationality from car c, orderer o where c.car_no=o.car_no";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				modelName=rs.getString("car_model");
				car_color=rs.getString("car_color");
				option=rs.getString("car_option");
				tfPrice.setText(rs.getString(String.valueOf("car_price")));
				tfName.setText(rs.getString("order_name"));
				tfAddr.setText(rs.getString("order_addr"));
				tfHp.setText(rs.getString("order_hp"));
				tfNati.setText(rs.getString("order_nationality"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}		
		
		
	}
	
	public void addData() {
		
		}
	
	public static void main(String[] args) {
		//new CarUpdate("업데이트 폼");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}
}