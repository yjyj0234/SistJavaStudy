package spring.di.anno2;

import org.springframework.stereotype.Component;

//bean�� ���(component)
@Component("tmgo")
public class TManggo implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("�±�����");
	}

}
