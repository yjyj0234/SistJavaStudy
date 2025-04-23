package day0219;

import java.util.Scanner;

public class QuizOper_04 {

	public static void main(String[] args) {
		// 현재 지갑에 있는 돈을 입력하여 만원,천원,백원,일원 갯수를 출력하시오
		/*
		 * 금액을 입력하시오
		 * 752543
		 * 만원: 75
		 * 천원: 2
		 * 백원:5
		 * 십원:4
		 * 일원:3
		 */
		
		Scanner sc=new Scanner(System.in);
		
		int mon,man,tho,hun,ten,one;
		
		System.out.println("금액을 입력하시오");
		mon=sc.nextInt();
		
		man=mon/10000;
		tho=(mon-(man*10000))/1000;
		hun=(mon-(man*10000)-(tho*1000))/100;
		ten=(mon-(man*10000)-(tho*1000)-(hun*100))/10;
		one=mon-(man*10000)-(tho*1000)-(hun*100)-(ten*10);
		
		System.out.println("만원: "+man);
		System.out.println("천원: "+tho);
		System.out.println("백원: "+hun);
		System.out.println("십원: "+ten);
		System.out.println("일원: "+one);
		
		/*System.out.println("만원: "+mon/10000);
		System.out.println("천원: "+(mon%10000)/1000);
		System.out.println("백원: "+(mon%1000)/100);
		System.out.println("십원: "+(mon%100)/10);
		System.out.println("일원: "+mon%10);
		*/
	}

}
