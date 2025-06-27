package spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.AnswerDao;
import spring.mvc.dto.AnswerDto;

@Controller
public class AnswerController {
	
	//dao 가져올때 @Autowired 생각하기 
	@Autowired
	AnswerDao dao;
	
	@PostMapping("/board/ainsert")
	public String insert(@ModelAttribute AnswerDto dto,
					@RequestParam int num,
					@RequestParam int currentPage) {
		dao.insertAnswer(dto);
		
		return "redirect:content?num="+num+"&currentPage="+currentPage;  
	}
	
	
}
