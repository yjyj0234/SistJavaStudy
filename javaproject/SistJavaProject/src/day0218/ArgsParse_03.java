package day0218;

public class ArgsParse_03 {

	public static void main(String[] a) {
		// TODO Auto-generated method stub

		String name=a[0];
		//String kor="80";
		int kor=Integer.parseInt(a[1]);
		int eng=Integer.parseInt(a[2]);
		int mat=Integer.parseInt(a[3]);
		
		//출력
		System.out.println("내이름은 "+name);
		System.out.println("국어점수="+kor);
		System.out.println("영어점수="+eng);
		System.out.println("수학점수="+mat);
		System.out.println("세과목의 합계는="+(kor+eng+mat)+"점 입니다");
		
	}

}
