package day0218;

public class DataType_07 {

	public static void main(String[] args) {
		// 아스키코드 A=65    a=97
		//묵시적형변환  자동으로 결정되는 타입
		/* String + int=String
		 * double+int=double
		 * long+short=long
		 * char+int=int */
		
		char a='A';
		System.out.println(a);
		System.out.println(a+32); //65+32
		System.out.println((char)(a+32)); //강제형변환
		
		System.out.println("Today"+5+6); //앞에서부터 더해진다
		System.out.println("Today"+(5+6)); //괄호부분이 먼저더해진다
		System.out.println('A'+3); //68
		System.out.println(2+'b');//100
		System.out.println('a'+'b'); //195
		
		//printf 이용해서 TODAY라고 출력
		System.out.printf("%c%c%c%c%c\n",84,79,68,65,89);
	}

}
