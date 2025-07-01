package boot.data.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.InfoDto;

@Controller
public class FormReadController {
	//form1을 읽어서 result 1에서 결과 출력
	
	@PostMapping("/read1")
	public ModelAndView getResult(@RequestParam String name,
			@RequestParam int java,@RequestParam int spring) {
		ModelAndView model=new ModelAndView();
		
		model.addObject("name",name);
		model.addObject("java", java);
		model.addObject("spring", spring);
		
		int tot=java+spring;
		double avg=tot/2.0;
		model.addObject("total", tot);
		model.addObject("avg", avg);
		model.setViewName("/result/result1");
		return model;
	}
	@PostMapping("/read2")
	public String result(@ModelAttribute InfoDto dto){
		
		return "result/result2";
	}
	//form3를 읽어서 result3로 출력
	@PostMapping("/read3")
	public ModelAndView result(@RequestParam String irum,
			@RequestParam String mbti,@RequestParam String major){
		ModelAndView model=new ModelAndView();
		Map<String, String> map=new HashMap<>();
		map.put("irum", irum);
		map.put("mbti", mbti);
		map.put("major", major);
		
		model.addObject("irum", map.get("irum"));
		model.addObject("mbti", map.get("mbti"));
		model.addObject("major", map.get("major"));
		
		model.setViewName("result/result3");
		
		return model;
		
	}
	
	
}
