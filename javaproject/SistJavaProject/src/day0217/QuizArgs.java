package day0217;

public class QuizArgs {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//단 이름, 나이, 지역은 args변수 활용
		System.out.println("**자바 매개변수 연습**");
		System.out.println("");
		System.out.println("이름: "+args[0]);
		System.out.println("나이: "+args[1]+"세");
		System.out.println("지역: "+args[2]+"시");
		System.out.println("====================================================");
		System.out.println("나는 "+args[2]+"시에 사는 "+args[1]+"세 "+ args[0]+"입니다");
	}

}