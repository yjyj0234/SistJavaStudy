package day0305;

public class Ex11ClassNotFound {

	public static void main(String[] args) {
		
		try {
			Class cla=Class.forName("java.lang.String2"); //어떤 클래스파일의 위치를 알려줘
			System.out.println("클래스를 찾았습니다");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println(e.getMessage());

		} finally {
			//예외 발생 여부 관계없이 수행할 문장
			//혹은 자원을 사용했다면 반드시 여기서 반납
			System.out.println("프로그램 안전하게 종료합니다");
		}
		
	}
}
