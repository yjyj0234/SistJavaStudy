package day0326;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Container;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

	public class ShopAdd extends JFrame implements ActionListener{

		Container cp;
		JTextField tfSang,tfSu,tfDan;
		JLabel lblPhoto;
		String imageName;
		JButton btnAdd,btnImage;
		ShopDbModel db=new ShopDbModel();
		//내부클래스
		PhotoDraw pDraw=new PhotoDraw();
		
		//생성자
		public ShopAdd(String title) {
			super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
			
			//위치 너비
			this.setBounds(100, 100, 500, 500);
			
			cp=this.getContentPane();
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			cp.setBackground(Color.white);
			initDesign();
			this.setVisible(true);
		}
		//디자인
		public void initDesign() {
			this.setLayout(null);
			JLabel lbl1=new JLabel("상품명");
			lbl1.setBounds(15, 40, 50, 30);
			this.add(lbl1);
			
			tfSang=new JTextField();
			tfSang.setBounds(70, 40, 100, 30);
			this.add(tfSang);
			
			//이미지 불러오는 버튼
			btnImage=new JButton("사진 선택");
			btnImage.setBounds(70, 80, 100, 30);
			this.add(btnImage);
			
			btnImage.addActionListener(this);  //이미지버튼에 액션이벤트 추가
			
			//이미지 위치 미리 지정
			pDraw.setBounds(300, 40, 150, 150);
			this.add(pDraw);
			
			lblPhoto=new JLabel("이미지명");
			lblPhoto.setBounds(20, 120, 280, 30);
			lblPhoto.setBorder(new LineBorder(Color.cyan));
			this.add(lblPhoto);
			
			//수량
			JLabel lbl2=new JLabel("수량");
			lbl2.setBounds(15, 200, 50, 30);
			this.add(lbl2);
			
			tfSu=new JTextField();
			tfSu.setBounds(70, 200, 100, 30);
			this.add(tfSu);
		
			//단가
			JLabel lbl3=new JLabel("단가");
			lbl3.setBounds(15, 260, 50, 30);
			this.add(lbl3);
			
			tfDan=new JTextField();
			tfDan.setBounds(70, 260, 100, 30);
			this.add(tfDan);
			
			//추가(insert)
			btnAdd=new JButton("DB 추가");
			btnAdd.setBounds(15, 350, 100, 30);
			btnAdd.addActionListener(this);
			this.add(btnAdd);
		
			
		}
		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			Object ob=e.getSource();

			if(ob==btnImage) {
				//이미지 불러오기
				FileDialog dlg=new FileDialog(this, "이미지 가져오기", FileDialog.LOAD);
				dlg.setVisible(true);
				
				//이미지명 얻기(어느 경로+파일명)
				imageName=dlg.getDirectory()+dlg.getFile();
				//이미지명은 라벨에 출력
				lblPhoto.setText(imageName);
				//이미지 출력
				pDraw.repaint();
				
			}else if(ob==btnAdd) {
				//shop 생성
				ShopDto dto=new ShopDto();
				
				//dto에 4개의 데이터를 넣는다
				dto.setSangpum(tfSang.getText());
				dto.setPhoto(imageName);
				dto.setSu(Integer.parseInt(tfSu.getText()));
				dto.setDan(Integer.parseInt(tfDan.getText()));
				
				//insert
				db.insertShop(dto);
				//현재 창 닫기
				this.setVisible(false);
			}
		}
		//내부클래스
		class PhotoDraw extends Canvas{
			
			@Override
			public void paint(Graphics g) {
				// TODO Auto-generated method stub
				super.paint(g);
				
				//선택을 했다면
				if(imageName!=null) {
					Image image=new ImageIcon(imageName).getImage();
					g.drawImage(image, 10, 10, 100, 100, this);
					
				}
			}
		}

		/*public static void main(String[] args) {
			// TODO Auto-generated method stub
	    
			new ShopAdd("SHOPADD");
		}
*/
	}
	
