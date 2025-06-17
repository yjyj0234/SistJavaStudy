package spring.di.anno2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. Spring �����̳�(ApplicationContext) ����
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		// 2. "TManggo"��� �̸��� ��(Bean) ��������(Component�� ��ϵƴ�)
		Fruit fruit=(TManggo)app.getBean("tmgo");
		
		// 3. ������ Fruit ���� writeFruitName() �޼��� ȣ��
		fruit.writeFruitName();
		
		Fruit fruit2=(PhiManggo)app.getBean("pmgo");
		fruit2.writeFruitName();
		
		// 4. "myFruit"�̶�� �̸��� ��(Bean) ��������
		//   MyFruit Ÿ������ ����ȯ�Ͽ� ���
		MyFruit my=(MyFruit)app.getBean("myFruit");
		my.writeFruit();
		
	}

}
