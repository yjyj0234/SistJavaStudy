package day0218;

public class DataType_05 {

	public static void main(String[] args) {
		// 기본자료형 8가지
		
		//1.논리형,true,false
		boolean flag=false;
		
		//2.문자형
		//반드시 하나의 문자를 가지며 2바이트: c언어는 1바이트라 한글표현불가능
		//기본적으로 정수형,아스키코드로 변경가능하다...  ' '(소따옴표)로 표현 
		char ch='가';
		
		//3.정수형
		byte a=-128; //1바이트  -128~127까지 가능
		short b=32000; //16비트
		int c=670000; //32비트
		long num=100l;//64비트  반드시 l을 붙혀야 long 아니면 기본형이 int를 의미

		//4.실수형
		double d=42451.125897; //64비트 
		float f=3.1245897f;  //32비트 뒤에 f를 붙히지 않으면 더블을 의미
		//실수형이 정수형보다 큰타입으로 처리된다
		
		
		//출력
		System.out.println("flag="+flag);
		System.out.println("not flag="+!flag);
		System.out.println("ch="+ch);
		System.out.println("a="+a);
		System.out.println("b="+b);
		System.out.println("c="+c);
		System.out.println("num="+num);
		System.out.println("d="+d);
		System.out.println("f="+f);
		//전체자리수 10자리중 소수점 2자리
		System.out.printf("d=%10.2f\n",d);
		//소수점1자리
		System.out.printf("d=%.1f",d);
		
		
	}

}
