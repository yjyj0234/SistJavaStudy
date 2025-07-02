package boot.jpa.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {
	
	@Autowired
	MycarInter carInter;
	
	//insert
	public void insertCar(MycarDto dto) {
		
		//insert, update =>save
		//id타입 유무에 따라서 자동으로 insert or update
		carInter.save(dto);
	}
	//전체 출력
	public List<MycarDto> getAllDatas(){
		return carInter.findAll();
	}
	
	//num에 대한 dto반환
	public MycarDto getData(long num) {
		return carInter.getById(num);
	}
	
	public void updateCar(MycarDto dto) {
		carInter.save(dto);
	}
	public void deleteCar(long num) {
		carInter.deleteById(num);
	}
}
