package day0310;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class ArrayRndEvent9 extends JFrame{

	Container cp;
	JButton btnRandom;
	JLabel [] lblFood=new JLabel[9];   //9개의 음식명에 대한 배열
	String [] str= {"제육볶음","김밥","돈까스","김피탕","닭강정","햄버거","오믈렛","샐러드","꽈배기"};
	
	//생성자
	public ArrayRndEvent9(String title) {
		super(title);  //JFrame 부모생성자를 통해서 창제목을 통해서 제목을 볼수 있게한다
	
		this.setBounds(0, 10, 800, 900);
	
		cp=this.getContentPane();
		cp.setBackground(new Color(255,255,120));
		
		//창을 보여주게 하겠다
		initDesign();
		//메인프레임 종료
				this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	}
	
	public void initDesign() {
		//패널을 프레임의 센터에 추가
		JPanel pCenter=new JPanel(new GridLayout(3,3));
		this.add(pCenter);
		
		//라벨에 랜덤색상 추가
		for(int i=0;i<lblFood.length;i++) {
			lblFood[i]=new JLabel(str[i],JLabel.CENTER);  //Jlabel.center=패널의 가운데에 오게
			
			//r,g,b 랜덤색상 얻기
			int r=(int)(Math.random()*256);		//256이라서 0~255
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			
			lblFood[i].setBackground(new Color(r, g, b));
			
			//투명도 지정
			lblFood[i].setOpaque(true);
			
			//panel에 라벨을 추가
			pCenter.add(lblFood[i]);
			
			//버튼 눌렀을때 랜덤 색상 얻어오기
		}
		
		//프레임의 하단에 버튼생성후 추가
		btnRandom=new JButton("라벨색상변경");
		//방법1:this.add(btnRandom,BorderLayout.SOUTH);
		this.add("South",btnRandom);
		
		//이벤트
		btnRandom.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				for(int i=0;i<lblFood.length;i++) {
					
					
					//r,g,b 랜덤색상 얻기
					int r=(int)(Math.random()*256);		//256이라서 0~255
					int g=(int)(Math.random()*256);
					int b=(int)(Math.random()*256);
					
					lblFood[i].setBackground(new Color(r, g, b));
				}
			}
		});
	}
	

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new ArrayRndEvent9("스윙 기본 #3");
		
	}

	
}

