package day0310;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class StringBtnEvent4 extends JFrame implements ActionListener{

	Container cp;
	JButton btn1,btn2;
	//생성자
	public StringBtnEvent4(String title) {
		super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 볼수 있게한다
		
	
		this.setBounds(0, 10, 500, 500);		
	
		cp=this.getContentPane();
		cp.setBackground(new Color(0,0,0));
		
		initDesign();
		//메인프레임 종료
				this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	
	}
	public void initDesign() {
		this.setLayout(new FlowLayout());
		btn1 =new JButton("◀");
		btn2 =new JButton("▶");
		
		btn1.setBackground(Color.RED);
		btn2.setBackground(Color.BLUE);
		
		btn2.setForeground(Color.white);
		
		this.add(btn1);
		this.add(btn2);
		
		btn1.addActionListener(this);
		btn2.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		if(ob==btn1) {
			JOptionPane.showMessageDialog(btn1, "뒤로 갑니다");
		}
		else if(ob==btn2) {
			JOptionPane.showMessageDialog(btn2, "앞으로 갑니다");
		}
			
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new StringBtnEvent4("스윙 버튼이벤트 #4");
		
	}
	
}
