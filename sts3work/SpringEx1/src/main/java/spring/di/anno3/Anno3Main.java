package spring.di.anno3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno3Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		
		MySqlController my=(MySqlController)app.getBean("mySqlController");
		my.insert("손현정");
		my.select("손현정");
		my.delete("5");
		
	}

}
