package day0226;

public class Ex9Card {
	
	//iv_생성후 인스턴스변수명으로 접근
	String kind;//카드의 무늬_인스턴스 변수
	int number; //카드의 숫자_iv(인스턴스 변수)
	
	//클래스명으로 접근가능_인스턴스 생성없이 클래스가 로딩될때 생성 종료하면 소멸
	static int width;  //카드너비_static변수_클래스변수, 초기값 안주면 0
	static int height; //카드높이
	
}
