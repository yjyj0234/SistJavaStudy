package spring.test.quiz;

import org.springframework.stereotype.Component;

@Component
public class ShopDao implements ShopDaoInter {

	@Override
	public void insertShop(String sangpum, int price, String color) {
		// TODO Auto-generated method stub
		System.out.println(sangpum+":"+price+":"+color);
	}

	@Override
	public void deleteShop(String num) {
		// TODO Auto-generated method stub
		System.out.println(num+"�� ������!!!");
	}

	@Override
	public void selectShop(String sangpum, int price, String color) {
		// TODO Auto-generated method stub
		System.out.println("***��ǰ�����Ȳ***");
		System.out.println("============================");
		System.out.println("��ǰ�� : " +sangpum);
		System.out.println("���� : " +price);
		System.out.println("���� : " +color);
	}
}
