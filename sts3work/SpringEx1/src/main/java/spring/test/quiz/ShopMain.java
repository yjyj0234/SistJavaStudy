package spring.test.quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		OrderController orderCon=(OrderController)app.getBean("orderController");
		
		orderCon.orderInsert("Æ¼¼ÅÃ÷", 30000, "Â÷ÄÝ");
		orderCon.orderSelect("Æ¼¼ÅÃ÷", 30000, "ºí·¢");
		orderCon.orderDelete("4");
		
		
	}

}
