package day0218;

public class PrintfTest_04 {

	public static void main(String[] args) {
		// 문자열을 구성해서 출력하는 printf
		//문자열내에 따라오는 데이터를 순서대로 배치
		//%d:10진수정수  %f:10진수 실수   %s:문자열  %c:문자

		//변수선언
		int num1=10,num2=20;
		int num3=num1+num2;
		
		System.out.println(num1+"+"+num2+"="+num3);
		//printf로 출력
		System.out.printf("num1의 값은 %d,num2의 값은 %d,num3의 값은 %d입니다\n",num1,num2,num3);
		//System.out.println();
		System.out.printf("%d+%d=%d\n",num1,num2,num3);
		
		//Q.printf 하나로 출력하시오
		//안녕하세요 제이름은 김사랑 입니다
		//나이는 25세 입니다
		String name="김사랑";
		int age=25;
		
		System.out.printf("안녕하세요 제이름은 %s입니다 \n나이는 %d입니다",name,age);
		
		
	}

}
