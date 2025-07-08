package boot.my.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	@GetMapping("/")
	public String goMain() {
		return "main/mainpage";
	}
	
	@GetMapping("/board/list")
	public String boardlist() {
		return "board/boardlist";
	}
}
