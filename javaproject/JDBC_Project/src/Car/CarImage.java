package Car;

import java.awt.Container;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;

public class CarImage extends JPanel implements ActionListener {

	DefaultTableModel model;
	
	Container cp;		
	String modelName, defaultImgPath, rolloverImgPath;
	
	JButton [] btnCarModels;
	
	static String [][] data= {
			{"아반떼", "C:\\sist0217\\work\\JDBC_project\\test\\avante-25my-well-side.png", "C:\\sist0217\\work\\JDBC_project\\test\\avante-25my-45side.png"},	
			{"그랜저","C:\\sist0217\\work\\JDBC_project\\test\\grandeur-25my-well-side.png","C:\\sist0217\\work\\JDBC_project\\test\\main-grandeur-25my-45side.png"},
			{"아이오닉6","C:\\sist0217\\work\\JDBC_project\\test\\ioniq6-24my-well-side.png","C:\\sist0217\\work\\JDBC_project\\test\\ioniq6-24my-45side.png"},
			{"캐스퍼", "C:\\sist0217\\work\\JDBC_Project\\test\\casper-25my-well-side.png", "C:\\sist0217\\work\\JDBC_Project\\test\\casper-45side.png"},	
			{"코나EV","C:\\sist0217\\work\\JDBC_Project\\test\\kona-electric-24my-well-side.png","C:\\sist0217\\work\\JDBC_Project\\test\\kona-electric-24my-45side.png"},
			{"싼타페","C:\\sist0217\\work\\JDBC_Project\\test\\santafe-25my-well-side.png","C:\\sist0217\\work\\JDBC_Project\\test\\main-santafe-25my-45side.png"},
			};
	
	public void carImage()
	{
		
		
		addCarButton();
		
		
	}	
	
	public void addCarButton()
	{
		this.setLayout(null);
		btnCarModels= new JButton[data.length];
		int startX=50, startY=50, gapX= 200, gapY=150;
		int btnWidth=150, btnHeight=100;
		
        for (int i = 0; i < data.length; i++) {
            modelName= data[i][0];
            defaultImgPath= data[i][1];
            rolloverImgPath =data[i][2];
            
            //기본 이미지 아이콘 롤오버 이미지 아이콘 크기 설정, 이미지 입력
            ImageIcon defaultIcon= new ImageIcon(new ImageIcon(defaultImgPath).getImage().getScaledInstance(120, 80, Image.SCALE_SMOOTH));
            ImageIcon rolloverIcon= new ImageIcon(new ImageIcon(rolloverImgPath).getImage().getScaledInstance(120, 80, Image.SCALE_SMOOTH));
        
            btnCarModels[i] = new JButton(modelName,defaultIcon); 
            btnCarModels[i].setRolloverIcon(rolloverIcon);
            
            // 텍스트를 아이콘 아래로 정렬
            btnCarModels[i].setHorizontalTextPosition(JButton.CENTER);
            btnCarModels[i].setVerticalTextPosition(JButton.BOTTOM);
            
            btnCarModels[i].setFocusPainted(false); // 포커스 표시 제거
            btnCarModels[i].setBorderPainted(false); // 테두리 제거
            btnCarModels[i].setContentAreaFilled(false); // 버튼 배경 제거
            
            int row= i/2, col= i%2; //가로 세로 정렬 값
            int x=startX + (col* gapX), y= startY + (row* gapY); //이미지버튼 배치
            btnCarModels[i].setBounds(x, y, btnWidth, btnHeight);
            
            //버튼 이벤트..해당 모델의 CarInsert창 실행
            btnCarModels[i].addActionListener(this);
            
            this.add(btnCarModels[i]);            
 
        }
        
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		String [] models = {"아반떼","그랜저","아이오닉6","캐스퍼","코나EV","싼타페"};
			for(int i=0; i<data.length;i++)
			{
				if(ob==btnCarModels[i])
				{					
					CarInsert cInsert=new CarInsert(models[i]);
					cInsert.setVisible(true);					
				}
			}					
		}		
	}
	