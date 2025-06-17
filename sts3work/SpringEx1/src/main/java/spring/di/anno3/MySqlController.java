package spring.di.anno3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MySqlController {
	//testdao의 메서드를 가져온다(@Autowired)
	@Autowired
	TestDao testDao;
	
	public void insert(String name) {
		testDao.insert(name);
	}
	public void select(String name) {
		testDao.select(name);
	}
	public void delete(String num) {
		testDao.delete(num);
	}
}
