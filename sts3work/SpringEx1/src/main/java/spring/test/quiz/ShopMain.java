package spring.test.quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		OrderController orderCon=(OrderController)app.getBean("orderController");
		
		orderCon.orderInsert("Ƽ����", 30000, "����");
		orderCon.orderSelect("Ƽ����", 30000, "��");
		orderCon.orderDelete("4");
		
		
	}

}
