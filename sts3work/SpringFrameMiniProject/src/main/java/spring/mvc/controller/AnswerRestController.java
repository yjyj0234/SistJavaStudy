package spring.mvc.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.AnswerDao;
import spring.mvc.dao.BoardDao;
import spring.mvc.dto.BoardDto;

@RestController
public class AnswerRestController {
	//비동기방식만 전용으로 하는 RestController
	@Autowired
	AnswerDao adao;
	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/adelete")
	public HashMap<String, Integer> answerDelete(
			@RequestParam int idx,
			@RequestParam String pass
			){
		
		int passchk=adao.getCheckPass(idx, pass);
		if(passchk==1) {
			adao.deleteAnswer(idx);
		}
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("check", passchk);
		return map;
	}
	
	//list1
	@GetMapping("/rest/list1")
	public List<BoardDto> allList(){
		
		List<BoardDto> list=dao.getAjaxList();
		for(BoardDto dto:list) {
			if(!dto.getPhoto().equals("no")) {
			    String [] photos= dto.getPhoto().split(",");
				dto.setPhoto(photos[0]);
			}
		}
			
		return list;
	}
	
}
