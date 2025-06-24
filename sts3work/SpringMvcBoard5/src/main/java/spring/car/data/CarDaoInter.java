package spring.car.data;

import java.util.List;

import org.springframework.ui.Model;

public interface CarDaoInter {
	public List<CarDto> getAllCarList();
	public void insertMyCar(CarDto dto);
	public CarDto getData(String num);
	public void updateMyCar(CarDto dto);
	public void deleteMyCar(String num);
	
	}
