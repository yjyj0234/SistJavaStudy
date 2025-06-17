package spring.di.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class InfoMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext3.xml");
		
		//MyInfo 생성 후 확인
		MyInfo my=(MyInfo)context.getBean("my");
		
		//toString 메서드는 생략시 자동호출되는 메서드
		System.out.println(my);
		System.out.println(my.toString()); //굳이 안써도됨
		
		Moim m=(Moim)context.getBean("moim");
		m.writeData();
	}

}
