package spring.di.ex3;

public class MyInfo {
	
	String name,addr;
	int age;
	
	//생성자
	public MyInfo(String name, String addr, int age) {
		//super(); //오브젝트
		this.name=name;
		this.addr=addr;
		this.age=age;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "MyInfo [name="+name+", addr="+addr+", age="+age+"]";
		
	}
}
