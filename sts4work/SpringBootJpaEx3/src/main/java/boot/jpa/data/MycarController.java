package boot.jpa.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {
	@Autowired
	MycarDao dao;
	
	@GetMapping("/carform")
	public String form() {
		return "/addform";
	}
	
	//리스트 ..시작 / or list 로 갈 수 있게 
	@GetMapping({"/","/list"})
	public ModelAndView list() {
		ModelAndView model= new ModelAndView();
		List<MycarDto> list=dao.getAllDatas();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		model.setViewName("/carlist");
		
		return model;
	}
	//insert        update도 같이 묶어 쓸수 있음 
	@PostMapping("insert")
	public String insert(@ModelAttribute MycarDto dto){
		dao.insertCar(dto);
		return "redirect:list";
	}
	
	@GetMapping("updateform")
	public ModelAndView updateform(long num) {
		ModelAndView model=new ModelAndView();
		MycarDto dto=dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("/updateform");
		
		return model;
	}
	@PostMapping("update")
	public String update(@ModelAttribute MycarDto dto) {
		dao.updateCar(dto);
		return "redirect:list";
	}
	@GetMapping("delete")
	public String delete(@RequestParam long num) {
		dao.deleteCar(num);
		return "redirect:list";
	}
	
}
