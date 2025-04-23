package day0324;

import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class UpdateScore extends JFrame{

	Container cp;
	JTextField tfName,tfJava,tfJsp,tfSpring;
	JComboBox<String> cbBan; 
	JButton btnMod;  //수정버튼
	String num; //수정할 번호
	//생성자
	public UpdateScore(String title) {
		super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 볼수 있게한다
		
	
		this.setBounds(0, 10, 450, 400);
		
	
		cp=this.getContentPane();
		cp.setBackground(new Color(200,200,200));
		//메인프레임 종료
	//	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		initDesign();
		//창을 보여주게 하겠다
	//	this.setVisible(true);
		
		
	}
	public void initDesign() {
		this.setLayout(null);
		JLabel title1=new JLabel("학생명");
		JLabel title2=new JLabel("반");
		JLabel title3=new JLabel("Java");
		JLabel title4=new JLabel("Jsp");
		JLabel title5=new JLabel("Spring");
		
		title1.setBounds(30, 30, 60, 30);
		this.add(title1);
		
		title2.setBounds(30, 70, 60, 30);
		this.add(title2);
		title3.setBounds(30, 110, 60, 30);
		this.add(title3);
		title4.setBounds(30, 150, 60, 30);
		this.add(title4);
		title5.setBounds(30, 190, 60, 30);
		this.add(title5);
		
		tfName=new JTextField(4); //4개의 텍스트 필드 생성
		String [] ban= {"1강의장","2강의장","3강의장","4강의장"};
		cbBan= new JComboBox<String>(ban);
		tfJava=new JTextField(4);
		tfJsp=new JTextField(4);
		tfSpring=new JTextField(4);
		
		tfName.setBounds(90, 35, 80, 20);
		this.add(tfName);
		cbBan.setBounds(90, 75, 80, 20);
		this.add(cbBan);
		
		tfJava.setBounds(90, 115, 80, 20);
		this.add(tfJava);
		tfJsp.setBounds(90, 155, 80, 20);
		this.add(tfJsp);
		tfSpring.setBounds(90, 195, 80, 20);
		this.add(tfSpring);
		
		//버튼
		btnMod=new JButton("점수수정");
		btnMod.setBounds(70, 245, 100, 25);
		this.add(btnMod);
		
	}
	
	/*
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new AddScore("성적 입력창");
		
	}
	*/
}
