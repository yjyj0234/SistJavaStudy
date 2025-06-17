package spring.test.quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderController {
	//������ �ҷ�����
	@Autowired
	ShopDaoInter shopInter;
	
	int cnt=20;
	String name="ȫ�浿";
	public void orderInsert(String sang, int price, String color) {
		shopInter.insertShop(sang, price, color);
		System.out.println(name+"���� "+cnt+"�� �ֹ��Ϸ�!!");
	}
	public void orderDelete(String num) {
		shopInter.deleteShop(num);
		System.out.println(num+"�� ��ǰ ����");
	}		
	public void orderSelect(String sang, int price,String color) {
		shopInter.selectShop(sang, price, color);
		System.out.println("�ֹ��� : "+name);
		System.out.println("�ֹ����� : "+cnt);
	}
}
