package day0218;

public class VariableTest_01 {

	public static void main(String[] args) {
		// 변수선언
		//10진수 정수의 저장을 위해서 메모리공간을 할당하겠다
		//그 메모리 공간의 이름을 num이라고 하겠다
		int num1;
		num1=10;
		
		int num2=20;
		int num3=num1+num2;
		
		System.out.println(num1+"+"+num2+"="+num3);
		
		//String 변수선언
		String su1="10";
		String su2="20";
		
		System.out.println(su1+"+"+su2+"="+(su1+su2));
		
		//String 타입을 int타입으로 변경하려면
		//Integer.parseInt("1")    : 문자열1이 정수1로 반환
		//Double.parseDouble("12.5")  : 문자열 12.5가 실수타입12.5로 반환

	}

}
