package spring.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.board.data.BoardDaoInter;
import spring.board.data.BoardDto;

@Controller
public class BoardController {
	
	//daointer�� dao�� �����������ν�
	@Autowired
	private BoardDaoInter dao;
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		//�Ѱ���
		int totalCount=dao.getTotalCount();
		
		//����Ʈ
		List<BoardDto> list=dao.getAllDatas();
		model.addObject("list", list);
		
		model.addObject("totalCount", totalCount);
		model.setViewName("board/boardlist");
		
		return model;
	}
	
	@GetMapping("/writeform")
	public String goWrite() {
		return "board/writeform";
	}
	
	@PostMapping("/write")
	public String insert(@ModelAttribute BoardDto dto) {
		dao.insertBoard(dto);
		return "redirect:list";
	}
	//������ �ѱ��(post)
	//�ִ°� ��ȸ(get)
	
	@GetMapping("/content")
	public ModelAndView getOneData(@RequestParam String num) {
		ModelAndView model=new ModelAndView();
		BoardDto dto= dao.getOneData(num);
		model.addObject("dto", dto);
		model.setViewName("board/content");
		
		return model; 
	}
	@GetMapping("/updateform")
	public ModelAndView goUpdate(@RequestParam String num) {
		ModelAndView model=new ModelAndView();
		BoardDto dto=dao.getOneData(num);
		model.addObject("dto", dto);
		model.setViewName("board/updateform");
		
		return model;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDto dto) {
		dao.updateBoard(dto);
		return "redirect:content?num="+dto.getNum();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num) {
		dao.deleteBoard(num);
		return "redirect:list";
	}
}
