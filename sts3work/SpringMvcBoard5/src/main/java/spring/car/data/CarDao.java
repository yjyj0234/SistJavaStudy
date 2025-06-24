package spring.car.data;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarDao implements CarDaoInter {
	//자동 세션 받는 역할
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CarDto> getAllCarList() {
		// TODO Auto-generated method stub
		return session.selectList("getAllOfMyCar");
	}

	@Override
	public void insertMyCar(CarDto dto) {
		// TODO Auto-generated method stub
		//void라 리턴x
		session.insert("insertNewOfMyCar", dto);
	}

	@Override
	public CarDto getData(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("getOneDataOfMyCar", num);
	}

	@Override
	public void updateMyCar(CarDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfMyCar", dto);
	}

	@Override
	public void deleteMyCar(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfMyCar", num);
	}
	
}
