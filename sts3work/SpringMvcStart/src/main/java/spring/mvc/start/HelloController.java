package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

//bean에 등록
@Controller
public class HelloController {
	
	@GetMapping("/")
	public String hello1(Model model) {
		//Model:request에 데이터를 저장하기 위한 클래스
		//request.getParameter와 같다
		
		/*
		 * model.addAttribute("name", "영자");
		 * model.addAttribute("addr", "서울 강남 역삼");
		 */
		
		//포워드 (WEB-INF/day0618/result.jsp)을 의미
		return "start";//
	}
	@GetMapping("/sist/list")  //list 뒤에 .do, .me를 붙이던 다 호출이 됨
	public String result1(Model model) {
		model.addAttribute("name", "이영자");
		model.addAttribute("juso", "서울시 강남구");
		
		return "result1";
	}
	@GetMapping("/apple/insert")
	public String result2(Model model) {
		model.addAttribute("java", "88");
		model.addAttribute("spring", "95");
		
		return "result2";
	}
	@GetMapping("samsung/dragon")
	public ModelAndView result3() {
		
		//ModelAndView는 request에 저장하기 위한 model과
		//포워드 위한 view를 합쳐놓은 클래스
		
		ModelAndView mview=new ModelAndView();
		
		//request에 저장
		mview.addObject("html", "아주 잘함");
		mview.addObject("react", "기초수준");
		
		//포워드할 jsp파일 지정
		mview.setViewName("result3");
		return mview;
	}
	
}
