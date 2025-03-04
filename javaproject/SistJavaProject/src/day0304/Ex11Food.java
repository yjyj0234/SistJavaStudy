package day0304;

//인터페이스를 구현하는 클래스
//class 가 class를 Extends
//class가 Interface를 implement
public class Ex11Food implements Ex11FoodShop{

	@Override
	public void order() {
		// TODO Auto-generated method stub
		System.out.println(SHOPNAME);
		//SHOPNAME="역삼갈비"; (x) 상수 final만 오므로 못바꿈
		System.out.println("음식을 주문합니다");
	}

	@Override
	public void bedal() {
		// TODO Auto-generated method stub
		System.out.println("주문한 음식을 배달합니다");
	}
	
	
}
