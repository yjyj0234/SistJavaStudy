package spring.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.MemberDaoInter;
import spring.mvc.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	MemberDaoInter dao;  //메서드 자동주입
	
	//회원가입폼 나타나게
	@GetMapping("/member/form")
	public String memberform() {
		return "/member/memberform";
	}
	
	//맵의 키는 언제나 string, 
	@GetMapping("/member/idcheck")
	public @ResponseBody Map<String, Integer> idcheck(
			@RequestParam String id){
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		int count=dao.getIdCount(id);
		System.out.println(count);
		
		map.put("count", count);
		
		return map;
	}
//@ModelAttribute는 클라이언트로부터 일반 HTTP 요청 파라미터나 
//multipart/form-data 형태의 파라미터를 받아 객체로 사용하고 싶을 때 이용
//@ModelAttribute는 "가장 적절한" 생성자를 찾아 객체를 생성 및 초기화(확실하게 찾기위해 사용)
	@PostMapping("/member/insert")
	public String insertMember(@ModelAttribute MemberDto dto) {
		dao.insertMember(dto);
		//insert 했을때 새로고침하면 똑같은 데이터 들어가는것 방지용으로 redirect를 써야함
		//redirect도 맵핑주소로
		return "redirect:/member/list";
	}
}
