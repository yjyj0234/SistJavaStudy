package day0226;

public class Ex10StudentTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Ex10Student stu1=new Ex10Student();
		Ex10Student stu2=new Ex10Student();
		
		stu1.stuName="홍길동";
		stu2.stuName="김연아";
		
		stu1.grade=1;
		stu2.grade=4;
		
		Ex10Student.schoolName="쌍용초등학교";
		System.out.println("**클래스 멤버값 출력**");
		System.out.println("학교명: "+Ex10Student.schoolName);
		System.out.println("학생1의 정보");
		System.out.println("이름: "+stu1.stuName+", 학년: "+stu1.grade);
		System.out.println("학생2의 정보");
		System.out.println("이름: "+stu2.stuName+", 학년: "+stu2.grade);
		
	}

}
