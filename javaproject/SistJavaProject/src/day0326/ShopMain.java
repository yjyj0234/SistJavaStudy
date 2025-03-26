package day0326;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ShopMain extends JFrame implements ActionListener{

	Container cp;
	JButton btnAdd,btnDel,btnUpdate,btnSelect;
	ShopDbModel dbmodel=new ShopDbModel();
	//생성자
	public ShopMain(String title) {
		super(title); //JFrame부모생성자를 통해서 창제목을 통해서 제목을 보게하자
		
		//위치 너비
		this.setBounds(100, 100, 700, 500);
		
		cp=this.getContentPane();
	this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		cp.setBackground(Color.white);
		initDesign();
		this.setVisible(true);
		
	}
	public void initDesign() {
		this.setLayout(new GridLayout(4,1));  //4행1열의 그리드 레이아웃
		btnAdd=new JButton("상품 추가");
		btnDel=new JButton("상품 삭제");
		btnSelect=new JButton("전체 상품 조회");
		btnUpdate=new JButton("상품 수정");
		this.add(btnAdd);
		this.add(btnDel);
		this.add(btnSelect);
		this.add(btnUpdate);
		
		//이벤트
		btnAdd.addActionListener(this);
		btnDel.addActionListener(this);
		btnSelect.addActionListener(this);
		btnUpdate.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		if(ob==btnAdd) {
			//상품 추가폼 생성
			ShopAdd addShop=new ShopAdd("입력폼");
		}else if(ob==btnDel) {
			String num=JOptionPane.showInputDialog("삭제할 시퀀스 번호를 입력");
			int delCode=dbmodel.deleteShop(Integer.parseInt(num));
			if(delCode==0) {//삭제가 안되서 0이 반환
				JOptionPane.showMessageDialog(btnDel, "해당 num이 존재하지 않습니다");
			}else
				JOptionPane.showMessageDialog(btnDel, "삭제되었습니다");
			
		}else if(ob==btnSelect) {
			ShopList listShop=new ShopList("전체상품 조회");

		}else if(ob==btnUpdate) {
			//몇번을 수정할 지 묻고 그 해당 시퀀스의 수정창을 띄워준다
			String num=JOptionPane.showInputDialog("수정할 번호 입력");
			System.out.println(num);

			//취소시 메서드 종료
			if(num==null) {
				return;
			}
			ShopDto dto=dbmodel.getOneSangpum(num);
			ShopUpdate update=new ShopUpdate("수정폼");
			//수정폼에 데이타 넣기
			update.num=dto.getNum();
			update.tfSang.setText(dto.getSangpum());
			update.tfSu.setText(String.valueOf(dto.getSu()));
			update.tfDan.setText(String.valueOf(dto.getDan()));
			update.imageName=dto.getPhoto();
			update.lblPhoto.setText(dto.getPhoto());
			
			update.setVisible(true);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
    
		new ShopMain("SHOP");
	}
	

}
