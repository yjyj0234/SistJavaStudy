package day0219;

public class IfTest_07 {

	public static void main(String[] args) {
		
		int n=3;
		
		if(n<5)  //조건이 맞으면 {}안을 혹은 아래한줄을 실행후 빠져나간다 
			System.out.println("n은 5보다 큽니다");
		
		System.out.println("프로그램 종료");
		
		///////////////////////////////////
		
		int a=10;
		
		if(a%2==1)  //조건이 2개일 경우 하나의 조건만 만들고 else를 이용하여 나머지값을 구한다
		{
			System.out.println("a는 홀수입니다");
			System.out.println("홀수야");
		}
		else 
		{
			System.out.println("a는 짝수입니다");
			System.out.println("짝수야");
		}
		
		
	}

}