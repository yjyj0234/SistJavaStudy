package spring.di.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class InfoMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext3.xml");
		
		//MyInfo ���� �� Ȯ��
		MyInfo my=(MyInfo)context.getBean("my");
		
		//toString �޼���� ������ �ڵ�ȣ��Ǵ� �޼���
		System.out.println(my);
		System.out.println(my.toString()); //���� �Ƚᵵ��
		
		Moim m=(Moim)context.getBean("moim");
		m.writeData();
	}

}
