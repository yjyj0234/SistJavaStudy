package boot.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/my/mypage")
	public String mypage() {
		
		return "mypage";
	}
}
