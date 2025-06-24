package spring.mvc.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	//�ʱⰪ�� index�� home�� ���� redirect 
	@GetMapping("/home")
	public String mainView() {
		//Ÿ����� ������ ���̾ƿ����� ���
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
	
	//�α�����
	@GetMapping("/login/form")
	public String loginform() {
		return "/login/loginform";
	}
	//�������Ʈ
	@GetMapping("/member/list")
	public String memberform() {
		return "/member/memberlist";
	}
}
