package day0218;

import java.util.Scanner;

public class KeyBoardIn_12 {

	public static void main(String[] args) {
		// Scanner는 문자열이나 숫자를 모두 키보드로 입력받을때 생성

		Scanner sc=new Scanner(System.in);
		
		//변수선언
		String name,city,job;  //이름,지역
		int age;
		
		//입력할멘트
		System.out.print("이름을 입력해 보세요===>");
		name=sc.nextLine();
		System.out.print("사는 지역은 어디입니까?==>");
		city=sc.nextLine();
		System.out.print("당신의 나이는 몇살==>");
		//age=sc.nextInt(); 숫자입력후 엔터누르면 그엔터가 버퍼로 저장되어 다음문장읽을때 먼저읽어버리므로 형변환
		age=Integer.parseInt(sc.nextLine());
		
		System.out.print("당신의 직업은==>");
		job=sc.nextLine();
		
		//출력
		System.out.println("내이름은"+name+"입니다");
		System.out.println("사는 지역은 "+city+"입니다");
		System.out.println("나이는"+age+"세 입니다");
		System.out.println("나의 직업은"+job+"입니다");
		
	}

}
