package spring.mvc.json;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/jsonex1")
	public String goEx1() {
		return "ex1";
	}
	@GetMapping("/jsonex2")
	public String goEx2() {
		return "ex2";
	}
	@GetMapping("/jsonex3")
	public String goEx3() {
		return "ex3";
	}
	
}
