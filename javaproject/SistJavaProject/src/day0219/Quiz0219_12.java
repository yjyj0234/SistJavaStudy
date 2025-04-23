package day0219;

import java.util.Scanner;

public class Quiz0219_12 {

	public static void main(String[] args) {
		// 숫자를 입력하시오
		// 4
		// **if문** 4는 짝수 **삼항연산자** 4는 짝수
		Scanner sc=new Scanner(System.in);
		
		int num;
		System.out.println("숫자를 입력하시오");
		num=sc.nextInt();
		
		System.out.println("**if문**");
		if(num%2==0)
			System.out.println(num+"는(은) 짝수");
		else
			System.out.println(num+"는(은) 홀수");
		
		System.out.println("**삼항연산자**\n"+num+"은(는) "+(num%2==0?"짝수":"홀수"));
		
		//switch문으로
		System.out.println("**switch문으로");
		
		switch(num%2)
		{
		case 0:
			System.out.println("짝수");
			break;
		case 1:
			System.out.println("홀수");
			break;
		}
	}

}
