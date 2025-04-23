package day0220;

public class DoWhileTest_09 {

	public static void main(String[] args) {
		// 조건이 참일 동안 반복
		
		int i=1;
		
		System.out.println("While문 결과");
		while(i<=5)   //조건이 안맞으면 한번도 결과수행 안함
		{
			//출력 후 증가
			System.out.print(i++ +"  ");
			
		}
		System.out.println();
		
		System.out.println("do~While문 결과");
		i=1;
		do{
			System.out.print(i++ +"  ");
		}while(i<=5);                         //do while 은 조건 안맞아도 한번은 수행
		System.out.println("종료");
		
	}

}
