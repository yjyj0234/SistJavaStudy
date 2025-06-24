package spring.mvc.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	//초기값이 index의 home을 통해 redirect 
	@GetMapping("/home")
	public String mainView() {
		//타일즈에서 지정한 레이아웃으로 출력
		//return "home.tiles";
		return "/layout/main";
	}
	
	@GetMapping("/board/list")
	public String blist() {
		//return "input.tiles";
		
		return "/board/boardlist";
	}
	
	@GetMapping("/shop/list")
	public String slist() {
		//return "list.tiles";
		return "/sub/myshop/shoplist";
	}
	
	//로그인폼
	@GetMapping("/login/form")
	public String loginform() {
		return "/login/loginform";
	}
	//멤버리스트
	@GetMapping("/member/list")
	public String memberform() {
		return "/member/memberlist";
	}
}
