package day0226;

public class EX8Object {

		String name;   //인스턴스 멤버변수(앞에 static 안붙으면 무조건 멤버변수)..인스턴스 변수로 호출 가능.. 객체생성후 각각 다른값 가질 수 있다
		
		static final String MESSAGE="Happy Day"; 
	//static은 주로 상수 선언할 때 인스턴스 변수 없이 클래스명으로 접근 가능
		
	public static void main(String[] args) {
		
		System.out.println("static 멤버변수는 new로 생성없이 호출가능하다");
		System.out.println(EX8Object.MESSAGE); //클래스명,변수명으로 호출 가능
		System.out.println(MESSAGE); //같은 클래스 내에서는 클래스명 생략 가능
		
		//MESSAGE 초기값 재지정
		//MESSAGE="오늘 따뜻하다";    //final이라서 값변경 안됨
		
		EX8Object ab=new EX8Object();     //클래스명 참조변수명=new 클래스명();
		EX8Object cd=new EX8Object();
		EX8Object ef=new EX8Object();
		
		ab.name="손현정";
		cd.name="손흥민";
		ef.name="김연아";
		
		System.out.println(ab.name);
		System.out.println(cd.name);
		System.out.println(ef.name);		
		
		System.out.println("다같이 사용하는 메세지: "+MESSAGE);
	}

}
