package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {
	
	@GetMapping("/quiz/lunch/burger")
	public ModelAndView title() {
		ModelAndView quiz=new ModelAndView();
		quiz.addObject("title", "�̹�����°���");
		quiz.addObject("stuName", "��ȣ��");
		quiz.setViewName("quiz1");
		
		return quiz;
	}
	
}
