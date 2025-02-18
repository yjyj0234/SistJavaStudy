package day0218;

public class QuizArgs_11 {

	public static void main(String[] args) {
		//매개변수 이용하여(args) 다음과 같이 출력하시오.(sangname,price,amount,totPrice)
		/*
		 * 상품명: 갤럭시 폴드
		 * 수량: 6개
		 * 가격: 1200000원
		 * 총금액:7200000원
		 * */
		
		String sangname=args[0];
		int price=Integer.parseInt(args[1]);
		
		int amount=Integer.parseInt(args[2]);
		int totPrice=price*amount;
		
		System.out.println("상품명: "+sangname);
		System.out.println("수랑: "+amount);
		System.out.println("가격: "+price);
		System.out.println("총금액: "+totPrice);
	}

}
