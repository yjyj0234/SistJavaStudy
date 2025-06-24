package spring.mvc.board;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.car.data.CarDao;
import spring.car.data.CarDto;

@Controller
public class MyCarController {
	
	@Autowired
	CarDao dao;
	
	@GetMapping("/car/list")
	public String list(Model model) {
		//��ü����Ʈ ��������
		List<CarDto> list=dao.getAllCarList();
		
		//model=request, request�� ����
		model.addAttribute("totalCount",list.size());
		model.addAttribute("list", list);
		return "mycar/carlist";
	}
	
	//�Է������� ����
	@GetMapping("/car/writeform")
	public String carform() {
		return "mycar/carform";
	}
	//insert���� �� ����Ʈ
	//sql==>dao==>controller(ȣ���� ��������..)
	@PostMapping("/car/carinfo")
	public String newcar(@ModelAttribute CarDto dto) {
		dao.insertMyCar(dto);
		return "redirect:list";
	}
	@GetMapping("/car/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView model=new ModelAndView();
		CarDto dto=dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("mycar/carupdateform");
		return model;
	}
	
	@PostMapping("/car/carupdate")
	public String update(@ModelAttribute CarDto dto) {
		dao.updateMyCar(dto);
		return "redirect:list";
	}
	@GetMapping("/car/delete")
	public String delete(@RequestParam String num) {
		dao.deleteMyCar(num);
		return "redirect:list";
	}
}
