package spring.di.anno2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Anno2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. Spring 컨테이너(ApplicationContext) 생성
		ApplicationContext app=new ClassPathXmlApplicationContext("anno.xml");
		
		// 2. "TManggo"라는 이름의 빈(Bean) 가져오기(Component로 등록됐던)
		Fruit fruit=(TManggo)app.getBean("tmgo");
		
		// 3. 가져온 Fruit 빈의 writeFruitName() 메서드 호출
		fruit.writeFruitName();
		
		Fruit fruit2=(PhiManggo)app.getBean("pmgo");
		fruit2.writeFruitName();
		
		// 4. "myFruit"이라는 이름의 빈(Bean) 가져오기
		//   MyFruit 타입으로 형변환하여 사용
		MyFruit my=(MyFruit)app.getBean("myFruit");
		my.writeFruit();
		
	}

}
