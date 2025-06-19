package spring.mvc.coffee;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.TestDto;

@Controller
public class FormController {
	
	@GetMapping("/data/myform")
	public String form() {
		
		return "data/form1";
	}
	
	@GetMapping("/data/read1")
	//따로 지정(강호동..)을 안해줘서 넘어오는값이 필요함->@RequestParam
								//@RequestParam("name")도 가능
	
	//400번 오류가 나는경우(폼에 없는 값을 넘겨야 할 때): 그 값에다가
	//required=false로 주거나 defaultvalue값을 주어야함 
	public ModelAndView read1(@RequestParam String name,
			@RequestParam int age,
			@RequestParam String addr,
			//@RequestParam (required=false) String msg) 또는 
			@RequestParam(value="msg",defaultValue = "Happy Day!!!") String msg)
	{
		ModelAndView model=new ModelAndView();
		
		//request에 저장
		model.addObject("name", name);
		model.addObject("age", age);
		model.addObject("addr", addr);
		model.addObject("msg", msg);
		
		//포워드
		model.setViewName("data/process1");
		
		return model;
	}
	
	//post방식이라서 post 매핑
	//@ModelAttribute : dto를 한번에 읽어옴
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute TestDto dto) {
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		model.setViewName("data/process2");
		
		return model;
	}
	
	@PostMapping("/data/read3")
										//key값, value값 string 으로 받겠다
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		ModelAndView model = new ModelAndView();
		
		String sang= map.get("sang");
		String cate= map.get("category");
		String price=map.get("price"); //필요시 형변환
		
		String data=sang+"의 카테고리는 "+cate+"이며 가격은 "+price+"원 입니다";
		
		model.addObject("data", data);
		model.setViewName("data/process3");
		
		return model;
	}
}
