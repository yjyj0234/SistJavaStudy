package day0312;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.ButtonGroup;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class QuizCheckRadio07 extends JFrame implements ActionListener{

    Container cp;
    // 결과 출력
    JLabel lblMessage;
    JLabel lblGender;
    JLabel lblCountry;
    // 라디오 버튼
    JRadioButton[] radioButton = new JRadioButton[2];
    JRadioButton[] radioButtonC = new JRadioButton[5];
    
    JCheckBox[] cbCountry = new JCheckBox[6];
    
    Color[] colors = {Color.red, Color.orange, Color.yellow, Color.blue, Color.gray}; 

    // 생성자
    public QuizCheckRadio07(String title) {
        super(title);  // JFrame 부모 생성자를 통해 창 제목을 설정

        this.setBounds(100, 100, 800, 500);
        
        cp = this.getContentPane();
        cp.setBackground(new Color(255, 255, 255));
        // 메인 프레임 종료
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        // 창을 보이게 하겠다
        initDesign();
        this.setVisible(true);
    }

    public void initDesign() {
    	this.setLayout(null);
        ButtonGroup bg = new ButtonGroup();
        String[] country = {"일본", "미국", "태국", "체코", "싱가폴", "영국"};
        String[] str1 = {"남자", "여자"};
        
        // 성별 선택 패널
        JPanel pTop = new JPanel();
        pTop.setBorder(new TitledBorder("성별"));
        pTop.setBounds(300, 10, 300, 80);
        this.add(pTop);
        
        // 출력 라벨들
        //성별
        lblGender = new JLabel();
        lblGender.setFont(new Font("", Font.BOLD, 20));
        lblGender.setBorder(new LineBorder(new Color(255,0,255)));
        lblGender.setBounds(200, 220, 500, 100);
        lblGender.setOpaque(true);
        this.add(lblGender);
        //나라
        lblCountry = new JLabel();
        lblCountry.setFont(new Font("", Font.BOLD, 20));
        lblCountry.setBounds(200, 330, 500, 120);
        lblCountry.setOpaque(true);
        this.add(lblCountry);
     
        
        // 성별 선택 라디오 버튼 추가

        for (int i = 0; i < radioButton.length; i++) {
            radioButton[i] = new JRadioButton(str1[i], i == 0);
            
           
            bg.add(radioButton[i]);
            pTop.add(radioButton[i]);
            radioButton[i].addActionListener(this);
        }

        // 색상 패널
        JPanel pWest = new JPanel();
        pWest.setBorder(new TitledBorder("색상"));
        pWest.setBounds(10, 50, 170, 300);
        
        //FlowLayout: 가로로 배치하도록 설정
        //FlowLayout flowLayout = new FlowLayout(FlowLayout.CENTER); 
        //boxlayout.Y_AXIS 버튼들 세로로 변경
        pWest.setLayout(new BoxLayout(pWest, BoxLayout.Y_AXIS));
        this.add(pWest, BorderLayout.WEST);
        ButtonGroup bg2 = new ButtonGroup();    
        String[] str2 = {"빨강", "오렌지", "노랑", "파랑", "회색"};
        for (int i = 0; i < radioButtonC.length; i++) {
            radioButtonC[i] = new JRadioButton(str2[i], i == 0);
            
            bg2.add(radioButtonC[i]);
            pWest.add(radioButtonC[i]);
            if (i < radioButtonC.length ) {
                pWest.add(Box.createVerticalStrut(30));  // 10px 간격 추가 box
            }
            radioButtonC[i].addActionListener(this);
        }
        

        // 여행한 나라 선택 체크박스 추가
        JPanel pCenter = new JPanel();
        pCenter.setBorder(new TitledBorder("여행해본 나라"));
        pCenter.setBounds(200, 120, 500, 100);
        String[] countryList = {"일본", "미국", "태국", "체코", "싱가폴", "영국"};
        
        for (int i = 0; i < cbCountry.length; i++) {
        	int cPo=100;
            cbCountry[i] = new JCheckBox(countryList[i]);
            pCenter.add(cbCountry[i]);
            cbCountry[i].addActionListener(this);
        }
        this.add(pCenter, BorderLayout.CENTER);
    }
    
    
    // 색상 변경, 성별 및 여행지 정보 출력
    @Override
    public void actionPerformed(ActionEvent e) {
        // 성별 출력
        String msg = "저는 ";
        for (int i = 0; i < radioButton.length; i++) {
            if (radioButton[i].isSelected()) {
                msg += radioButton[i].getText() + "입니다";
            }
        }
        lblGender.setText(msg);
        
        // 색상 변경
        for (int i = 0; i < radioButtonC.length; i++) {
            if (e.getSource() == radioButtonC[i]) {
                lblGender.setForeground(colors[i]);
            }
        }
        
        // 여행한 나라 출력
        String s = "가본 나라는 ";
        int select = 0;
        for (int i = 0; i < cbCountry.length; i++) {
            if (cbCountry[i].isSelected()) {
                select++;
                s += cbCountry[i].getText() + " ";
            }
        }
        if (select == 0) {
            s = "아직 가본 나라가 없습니다";
        }
        lblCountry.setText(s);
    }

    public static void main(String[] args) {
        new QuizCheckRadio07("퀴즈 #7");
    }
}