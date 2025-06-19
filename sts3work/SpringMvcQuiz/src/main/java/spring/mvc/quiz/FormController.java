package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FormController {
	
	@GetMapping("/")
	public String form() {
		return "quiz/start";
	}
	
	@GetMapping("quiz/start")
	public String quiz() {
		
		return "quiz/sawonform";
	}
	@PostMapping("/quiz/sawon")
	public ModelAndView info(@ModelAttribute SawonDto dto) {
	
		ModelAndView model=new ModelAndView();
		model.addObject("dto", dto);
		model.setViewName("quiz/sawoninfo");
		
		return model;		
	}
}
