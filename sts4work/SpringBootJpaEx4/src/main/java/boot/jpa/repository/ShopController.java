package boot.jpa.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import boot.jpa.dto.ShopDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ShopController {
	@Autowired
	ShopDao dao;
	
	@GetMapping({"/","list"})
	public ModelAndView main() {
		ModelAndView model=new ModelAndView();
		List<ShopDto> dto=dao.allList();
		model.addObject("dto", dto);
		
		model.setViewName("food/foodlist");
		
		return model;
	}
	
	@GetMapping("/form")
	public String form() {
		return "food/form";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute ShopDto dto) {
		dao.shopInsert(dto);
		return "redirect:/";
	}
	
	
}
