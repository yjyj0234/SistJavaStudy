package boot.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.board.dao.BoardDao;
import boot.board.dto.BoardDto;
import boot.board.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@GetMapping("/")
	public String home() {
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		List<BoardDto> list=service.getAll();
		model.addObject("list", list);
		model.addObject("count", list.size());
		model.setViewName("board/boardlist");  //yml에서 /WEB-INF/까지만했음
		
		return model;
	}
	//폼
	@GetMapping("/board/form")
	public String form() {
		return "board/addform";
	}
	
	//insert
	@PostMapping("/board/insert")
	public String insertBoard(@ModelAttribute BoardDto dto,
			MultipartFile upload, HttpSession session) {
		service.insertBoard(dto, upload, session);
		return "redirect:list";
	}
	
	//detail
	@GetMapping("/board/detail")
	public ModelAndView detailP(@RequestParam long num) {
		ModelAndView model=new ModelAndView();
		BoardDto dto=service.getOne(num);
		String content=dto.getContent().replace("\n", "<br>");
		model.addObject("dto", dto);
		model.setViewName("board/detailpage");
		return model;
	}
	//updateform
	@GetMapping("/board/updateform")
	public String updateForm(@RequestParam long num,Model model) {
		BoardDto dto=service.getOne(num);
		model.addAttribute("dto", dto);
		
		return "board/updateform";
	}
	//update
	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto,MultipartFile upload,
			HttpSession session) {
		service.updateBoard(dto, upload, session);
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/board/delete")
	public String delete(@RequestParam Long num,HttpSession session) {
		service.deleteBoard(num, session);
		return "redirect:list";
	}
	
}
