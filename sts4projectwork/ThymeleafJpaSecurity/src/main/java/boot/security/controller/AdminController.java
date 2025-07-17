package boot.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/admin")
	public String main() {
		return "admin";
	}
	@GetMapping("/access-denied")
	public String accessError() {
		return "access-denied";
	}
}
