package spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MessageMain {

	public static void main(String[] args) {
		// ��������� ���� �� �޼��� ȣ��
		
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext1.xml");
		MessageInter m1=(Message1)context.getBean("msg1");
		m1.sayHello("�̳�");
		
		MessageInter m2=context.getBean("msg2", Message2.class);
		m2.sayHello("����");
	}
}
