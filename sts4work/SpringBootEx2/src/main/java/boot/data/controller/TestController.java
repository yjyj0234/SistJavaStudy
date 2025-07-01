package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", "홍길동");
		model.addObject("addr", "강화도");
		model.addObject("hp", "011-232-2345");
		
		model.setViewName("/list");
		
		return model;
		
	}
}
