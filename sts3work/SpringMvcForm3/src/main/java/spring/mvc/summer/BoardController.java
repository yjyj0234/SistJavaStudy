package spring.mvc.summer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@GetMapping("/board/form1")
	public String form1() {
		return "board/writeform";
	}
	//form ���� process���� ���⼱ /WEB-INF/������ �Ǿ��־ 
	@PostMapping("/board/process")
	public ModelAndView process1(
			@RequestParam String name,
			@RequestParam String mydate,
			@RequestParam String gender,
			//require�� true�� �⺻��, �׸��� ��� ������ �ȳ����� false,int�������� �ȵ�
			@RequestParam(required = false) String msg,
			//�Ǵ� defaultValue���� �ָ� �ȴ�
			@RequestParam (defaultValue = "1") String currentPage
			){
		
			ModelAndView model=new ModelAndView();
			model.addObject("name", name);
			model.addObject("mydate", mydate);
			model.addObject("gender", gender);
			model.addObject("msg", msg);
			model.addObject("currentPage", currentPage);
			
			model.setViewName("board/result1");
			
			return model;
		}
	@GetMapping("/board/result2")
	public String result2(Model model) {
		model.addAttribute("myimg1", "../image/logoImg/acc03.png");
		model.addAttribute("title", "���� �����ϴ� ���");
		
		return "board/result2";
	}
	@GetMapping("/board/list")
	public String result3() {
		
		return "board/result3";
	}
}
