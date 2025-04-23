package day0218;

import java.util.Calendar;

public class CalAgeTest_10 {

	public static void main(String[] args) {
		// 자바실행시 이름과 태어난 연도를 입력하면 나이를 구할수있다
		//args 변수 이용해서 해볼것
		
		//import
		Calendar cal=Calendar.getInstance();
		
		//변수선언
		String name=args[0];
		//String age=args[1];
		int myBirthYear=Integer.parseInt(args[1]);
		//현재년도
		int culYear=cal.get(cal.YEAR); //2025
		
		//계산
		int myAge=culYear-myBirthYear;
		
		//출력
		System.out.println("이름: "+name);
		System.out.println("태어난 연도: "+myBirthYear+"년생");
		System.out.println("나이: "+myAge+"세");

	}

}
