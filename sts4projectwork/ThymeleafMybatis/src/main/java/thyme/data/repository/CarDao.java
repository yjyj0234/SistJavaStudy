package thyme.data.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import thyme.data.dto.CarDto;

@Repository
@AllArgsConstructor
public class CarDao {
	CarDaoInter daointer;
	
	//db저장
	public void insertCar(CarDto dto) {
		daointer.save(dto);
	}
	
	//전체출력
	public List<CarDto> getAllmyCars(){
		//return daointer.findAll();
		return daointer.findAll(Sort.by(Sort.Direction.ASC,"carprice"));
		//가격이 싼 순
		}
	//dto
	public CarDto getData(Long num) {
		return daointer.getOne(num);
	}
	//수정
	public void updateCar(CarDto dto) {
		daointer.save(dto);
	}
	
	//삭제
	public void deleteCar(Long num) {
		daointer.deleteById(num);
	}
	//부분삭제
	public void updateCarNoPhoto(CarDto dto) {
		Long num= dto.getNum();
		String carname=dto.getCarname();
		int carprice=dto.getCarprice();
		String carcolor=dto.getCarcolor();
		
		daointer.updateCarNoPhoto(num, carname, carprice, carcolor);
	}
}
