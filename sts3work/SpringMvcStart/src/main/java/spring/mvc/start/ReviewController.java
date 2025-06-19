package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	//nice/hi에 리소스의 아무 이미지나 출력할 것
	
	@GetMapping("/nice/hi")
	public String hiImage() {
		
		return "review/hi";
	}
	
	@GetMapping("/happy")
	public String niceImage(Model model) {
		model.addAttribute("msg", "매장 이미지");
		return "review/nice";
	}
	
	//happy라는 애는 msg값 전달...그아래 WEB-INF 이미지 하나 출력할것
}
