package thyme.data.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import thyme.data.dto.CarDto;
import thyme.data.repository.CarDao;

@Service
@AllArgsConstructor
public class CarService {
	
	CarDao dao;
	
	public void insertCar(CarDto dto, @RequestParam("carupload") MultipartFile carupload,
			HttpSession session) {
		String realpath=session.getServletContext().getRealPath("/carsave");
		System.out.println(realpath);
		
		String uploadName=carupload.getOriginalFilename();
		dto.setCarphoto(uploadName);
		
		try {
			carupload.transferTo(new File(realpath+"/"+uploadName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.insertCar(dto);
	}
	
	public List<CarDto> getAllmyCars(){
		return dao.getAllmyCars();
	}
	public CarDto getData(Long num) {
		return dao.getData(num);
	}
	public void updateCar(CarDto dto, @RequestParam("upload") MultipartFile carupload,
			HttpSession session) {
		String realpath=session.getServletContext().getRealPath("/carsave");
		System.out.println(realpath);
		
		String uploadName=carupload.getOriginalFilename();
		dto.setCarphoto(uploadName);
		
		try {
			carupload.transferTo(new File(realpath+"/"+uploadName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.updateCar(dto);
	}
	
	public void deleteCar(@RequestParam("num") Long num) {
		dao.deleteCar(num);
	}
	//사진빼고 수정
	public void updateCarNoPhoto(CarDto dto) {
		dao.updateCarNoPhoto(dto);
	}
}
