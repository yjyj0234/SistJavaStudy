package day0220;

import java.util.Scanner;

public class ReturnIfTest_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		int score;
		
		System.out.println("점수입력(1~100)");
		score=sc.nextInt();
		
		//잘못입력한 경우 종료
		if(score<1||score>100)
		{
			System.out.println("점수 범위를 잘못입력했어요");
			return;   //현재 메인함수를 종료 시켜줌
		}
		else
			System.out.println("점수: "+score+"점");
	}

}
