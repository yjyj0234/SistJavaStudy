package thyme.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import thyme.data.dto.CarDto;
import thyme.data.service.CarService;

@Controller
@RequiredArgsConstructor  //final일 경우에만 붙이기
public class CarController {
	
	private final CarService service;
	
	
	@GetMapping("/board/list")
	public String boardList(Model model) {
		List<CarDto> list=service.getAllmyCars();
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		return "board/list";
	}
	
	@GetMapping("/board/caradd")
	public String caradd() {
		return "board/addform";
	}
	//insert
	@PostMapping("/board/insert")
	public String insert(CarDto dto, @RequestParam("carupload") MultipartFile file,HttpSession session) {
		service.insertCar(dto, file, session);
		return "redirect:list";
	}
	
	@GetMapping("/board/detail")
	public String getData(@RequestParam("num") Long num,Model model) {
		CarDto dto=service.getData(num);
		model.addAttribute("dto", dto);
		return "board/detailpage";
	}
	//수정폼
	@GetMapping("/board/carupdate")
	public String carupform(@RequestParam("num") Long num,Model model) {
		CarDto dto=service.getData(num);
		model.addAttribute("dto", dto);
		return "board/updateform";
	}
	//수정
	@PostMapping("/board/update")
	public String update(CarDto dto, @RequestParam("upload") MultipartFile upload,HttpSession session) {
		if(upload.getOriginalFilename().equals("")) {
			service.updateCarNoPhoto(dto);
		}else {
			service.updateCar(dto, upload, session);
		}
		return "redirect:detail?num="+dto.getNum();
	}
	//삭제
	@GetMapping("/board/delete")
	public String delete(@RequestParam("num") Long num) {
		service.deleteCar(num);
		return "redirect:list";
	}
}
