package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HappyController {
	
	@GetMapping("/naver/board")
	public ModelAndView result4() {
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("age", "31");
		mview.addObject("local", "¼­¿ï");
		
		mview.setViewName("result4");
		
		return mview;
	}
	
	@GetMapping("/shop/detail")
	public String imageResult5() {
		
		
		
		return "result5";
	}
}
