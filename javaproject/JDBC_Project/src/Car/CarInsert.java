package Car;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

public class CarInsert extends JFrame implements ActionListener {
	
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
	
	CarImage ci=new CarImage();	
	DbConnect db=new DbConnect();
	String modelName, option;
	// 자동차 이미지 경로 (색상별)
    String[][] carImages = {
    		{"C:\\sist0217\\work\\JDBC_project\\test\\avante-white.png","C:\\sist0217\\work\\JDBC_project\\test\\avante-black.png"},
    		{"C:\\sist0217\\work\\JDBC_project\\test\\grandeur-white.png","C:\\\\sist0217\\\\work\\\\JDBC_project\\\\test\\\\grandeur-black.png"},
    		{"C:\\sist0217\\work\\JDBC_project\\test\\ioniq6-white.png","C:\\sist0217\\work\\JDBC_project\\test\\ioniq6-black.png"},
    		{"C:\\sist0217\\work\\JDBC_project\\test\\casper-white.png","C:\\sist0217\\work\\JDBC_project\\test\\casper-black.png"},
    		{"C:\\sist0217\\work\\JDBC_project\\test\\kona-white.png","C:\\sist0217\\work\\JDBC_project\\test\\kona-black.png"},
    		{"C:\\sist0217\\work\\JDBC_project\\test\\santafe-white.png","C:\\sist0217\\work\\JDBC_project\\test\\santafe-black.png"}
    };
	
	
	//생성자
	public CarInsert(String model) {
		super(model);
		this.modelName=model;
		//위치,너비
		this.setBounds(1000, 100, 800, 600);		
		cp=this.getContentPane();
		//메인프레임 종료
        //this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//창 색상
		cp.setBackground(new Color(245,245,245));		
		initDesign();
		setCarImage(0); // 기본 이미지는 흰색
		
		
		//this.setVisible(true);	
	}
	
	//디자인
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
	// 자동차 색상 변경 시 이미지 업데이트
	public void setCarImage(int colorIndex)
	{
		int modelIndex= getModelIndex();
		if(modelIndex !=-1)
		{
			icon= new ImageIcon(new ImageIcon(carImages[modelIndex][colorIndex])
					.getImage().getScaledInstance(450, 300, Image.SCALE_SMOOTH));
			lblImage.setIcon(icon);
		}
	}
	
	//모델 인덱스 찾기
	private int getModelIndex() {
		String [] models = {"아반떼","그랜저","아이오닉6","캐스퍼","코나EV","싼타페"};
		for(int i=0; i<models.length;i++)
		{
			if(modelName.equals(models[i])) 
			return i;
		}
		return -1;
	}
	
	public void insertCarAndOrderer()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmtCar=null;
		PreparedStatement pstmtOrderer=null;
		
		
		
		
		try {
			conn.setAutoCommit(false); //트랜잭션 시작
			
			String sqlCar="insert into car values(seq_car.nextval, ?, ?, ?, ?)";
			//자동차 정보 저장
			pstmtCar=conn.prepareStatement(sqlCar);			
			//바인딩
			pstmtCar.setString(1, modelName);
			pstmtCar.setString(2, car_color);
			pstmtCar.setString(3, option);
			pstmtCar.setString(4, tfPrice.getText());			
			pstmtCar.executeUpdate();
			
			String sqlOrderer="insert into orderer values(seq_order.nextval, ?, seq_car.currval , ?, ?, ?)";
			//주문자 정보 저장
			pstmtOrderer=conn.prepareStatement(sqlOrderer);			
			//바인딩
			pstmtOrderer.setString(1, tfName.getText());
			pstmtOrderer.setString(2, tfAddr.getText());
			pstmtOrderer.setString(3, tfHp.getText());
			pstmtOrderer.setString(4, tfNati.getText());			
			pstmtOrderer.executeUpdate();
			
			conn.commit(); //트랜잭션 커밋
		} catch (SQLException e) {
			
			try {
				if(conn !=null) conn.rollback(); //오류시 발생 시 롤백
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmtCar, conn);
			db.dbClose(pstmtOrderer, conn);
		}
		
		
	}	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//new CarInsert("추가폼");
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		for(int i=0; i<rbColors.length;i++)
		{
			if(rbColors[i].isSelected())
			{
				setCarImage(i); //선택된 색상에 맞는 이미지 변경
				car_color=carColor[i];
			}
		}
		
		option=null;
		ArrayList<String> selectedOptions=new ArrayList<String>();
		for(int i=0; i<cbOption.length; i++)
		{				
			if(cbOption[i].isSelected())
				
				
				
				
			{
			selectedOptions.add(cbOption[i].getText()); //옵션값 가져오기
			}			
		}
		option= String.join(", ", selectedOptions); //선택된 옵션을 문자열로 변환
		
		
		if(ob==btnSave)
		{
			insertCarAndOrderer();
			this.setVisible(false);
		}
		
	}
}