package spring.di.anno3;

import org.springframework.stereotype.Component;

@Component
public class TestDao {
	
	public void insert(String name) {
		System.out.println(name+"�� �߰���!!!");
	}
	public void select(String name) {
		System.out.println(name+"���� �ֿ뱳������ �л��Դϴ�.");
	}
	public void delete(String num) {
		System.out.println(num+"�� ������ �����Ϸ�");
	}
}
