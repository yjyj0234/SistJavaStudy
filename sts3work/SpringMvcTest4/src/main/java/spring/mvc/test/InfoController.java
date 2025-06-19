package spring.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	
	@GetMapping("/info/myform")
	public String GoInfoform() {
		
		return "info/infoform";
	}
	
	@GetMapping("info/write")
	public ModelAndView write(InfoDto dto) {
		ModelAndView model=new ModelAndView();
		model.addObject("dto", dto);
		model.setViewName("info/infowrite");
		
		return model;
	}
}
