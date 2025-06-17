package spring.di.anno2;

import org.springframework.stereotype.Component;

@Component("pmgo")
public class PhiManggo implements Fruit {

	@Override
	public void writeFruitName() {
		// TODO Auto-generated method stub
		System.out.println("ÇÊ¸®ÇÉ ¸Á°í");
	}

}
