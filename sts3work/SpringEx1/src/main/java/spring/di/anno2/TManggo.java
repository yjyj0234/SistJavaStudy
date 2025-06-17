package spring.di.anno2;

import org.springframework.stereotype.Component;

//bean에 등록(component)
@Component("tmgo")
public class TManggo implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("태국망고");
	}

}
