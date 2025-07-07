package boot.my.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	@GetMapping("/")
	public String goMain() {
		return "main/mainpage";
	}
	
	@GetMapping("/member/list")
	public String memlist() {
		return "member/memberlist";
	}
	
	@GetMapping("/login/form")
	public String login() {
		return "login/loginform";
	}
	@GetMapping("/board/list")
	public String boardlist() {
		return "board/boardlist";
	}
}
