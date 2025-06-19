package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	//nice/hi�� ���ҽ��� �ƹ� �̹����� ����� ��
	
	@GetMapping("/nice/hi")
	public String hiImage() {
		
		return "review/hi";
	}
	
	@GetMapping("/happy")
	public String niceImage(Model model) {
		model.addAttribute("msg", "���� �̹���");
		return "review/nice";
	}
	
	//happy��� �ִ� msg�� ����...�׾Ʒ� WEB-INF �̹��� �ϳ� ����Ұ�
}
