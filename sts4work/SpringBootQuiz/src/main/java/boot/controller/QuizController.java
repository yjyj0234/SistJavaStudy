package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import boot.dto.FoodDto;

@Controller
public class QuizController {
	@GetMapping("/")
	public String main() {
		return "/form";
	}
	
	@PostMapping("/foodshow")
	public String result(@ModelAttribute FoodDto dto) {
		return "/show";
	}
	
}
