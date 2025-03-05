package day0305;

abstract class AbstAnony{
	
	abstract public void order();
	abstract public void bedal();
	
}
////////////////////////////////
class Abst
{
	//AbstAnony 클래스 익명내부클래스 생성
	AbstAnony aa=new AbstAnony() {
		
		@Override
		public void order() {
			// TODO Auto-generated method stub
			System.out.println("주문 중");
		}
		
		@Override
		public void bedal() {
			// TODO Auto-generated method stub
			System.out.println("배달 중");
		}
	};
}

public class Ex7Anony {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Abst abst=new Abst();
		abst.aa.order();
		abst.aa.bedal();
		
	}

}
