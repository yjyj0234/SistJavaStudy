package spring.di.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	//지정한게 없어서 @Autowired 받을 수 있음
	//bean 매치가 안되는경우(fruit이 2개라서 에러가남....정확한 이름을 쓴 @Resource필요)
	//@Autowired
	//@Resource(name="tmgo")
	@Resource(name="pmgo")
	Fruit fruit;
	
	public void writeFruit() {
		System.out.println("***내가 좋아하는 과일은***");
		fruit.writeFruitName();
	}	
}
