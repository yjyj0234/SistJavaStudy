package spring.di.ex3;

public class Moim {
	String major;
	MyInfo info;
	
	public Moim(MyInfo info) {
		super();
		this.info=info;
	}
	public void setMajor(String major) {
		this.major=major;
	}
	//���
	
	public void writeData() {
		System.out.println("ȸ�� ���� ���");
		System.out.println("����:" +major);
		System.out.println("�̸�:"+info.name);
		System.out.println("�ּ�:"+info.addr);
		System.out.println("����:"+info.age );
		
	}
}
