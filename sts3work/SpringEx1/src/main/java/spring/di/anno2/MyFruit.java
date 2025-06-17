package spring.di.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	//�����Ѱ� ��� @Autowired ���� �� ����
	//bean ��ġ�� �ȵǴ°��(fruit�� 2���� ��������....��Ȯ�� �̸��� �� @Resource�ʿ�)
	//@Autowired
	//@Resource(name="tmgo")
	@Resource(name="pmgo")
	Fruit fruit;
	
	public void writeFruit() {
		System.out.println("***���� �����ϴ� ������***");
		fruit.writeFruitName();
	}	
}
