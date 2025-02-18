package day0218;

public class ParseVar_02 {

	public static void main(String[] args) {
		// 형변환후 계산해보자
		
		String su1="6";
		String su2="2";
		
		System.out.println("두수 더하기: "+(su1+su2));
		
		//문자열 su1,su2를 정수타입 int로 변환후 계산
		int s1=Integer.parseInt(su1);
		int s2=Integer.parseInt(su2);
		
		System.out.println("두수 더하기: "+(s1+s2));
		System.out.println("두수 빼기: "+(s1-s2));
		System.out.println("두수 곱하기: "+(s1*s2));
		System.out.println("두수 나누기: "+(s1/s2));//정수형끼리 연산시 결과도 정수형
		

	}

}
