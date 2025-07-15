package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberService;
import jakarta.servlet.http.HttpSession;

@RestController
public class BoardAnswerController {

	@Autowired
	BoardAnswerService aservice;
	@Autowired
	MemberService mservice;
	
	//@ModelAttribute : 폼 데이터 자동 바인딩
	//insert
	
	@PostMapping("/board/ainsert")
	public void insert(@ModelAttribute BoardAnswerDto dto,HttpSession session) {
		//세션 로그인한 id,name
		String myid=(String)session.getAttribute("myid");
		String name=mservice.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(name);
		
		aservice.insertAnswer(dto);
	}
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> getAList(@RequestParam int num){
		
		return aservice.getAllAnswers(num);
	}
	@GetMapping("/board/adelete")
	public void delete(@RequestParam int idx) {
		aservice.deleteAnswer(idx);
	}
}
