package day0305;

import java.util.Scanner;

//throws: 호출한 영역으로 예외처리를 던짐
//throw: 강제로 예외를 발생시킬때

public class Ex14Throws {
	
	public static void scoreInput() throws Exception
	{
		Scanner sc=new Scanner(System.in);
		int score=0;
		
		//점수가 1~100점 사이가 아니면 익셉션 강제 발생
		System.out.println("점수를 입력하세요");
		score=sc.nextInt();
		
		if(score<1||score>100)
		{
			throw new Exception("점수 입력 범위가 잘못되었어요");
		}
		else {
			System.out.println("나의 점수는 "+score+"점 입니다");
		}
			
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			scoreInput();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		System.out.println("***정상 종료***");
	}

}
