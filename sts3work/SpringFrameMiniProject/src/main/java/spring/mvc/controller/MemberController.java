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
	MemberDaoInter dao;  //�޼��� �ڵ�����
	
	//ȸ�������� ��Ÿ����
	@GetMapping("/member/form")
	public String memberform() {
		return "/member/memberform";
	}
	
	//���� Ű�� ������ string, 
	@GetMapping("/member/idcheck")
	public @ResponseBody Map<String, Integer> idcheck(
			@RequestParam String id){
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		int count=dao.getIdCount(id);
		System.out.println(count);
		
		map.put("count", count);
		
		return map;
	}
//@ModelAttribute�� Ŭ���̾�Ʈ�κ��� �Ϲ� HTTP ��û �Ķ���ͳ� 
//multipart/form-data ������ �Ķ���͸� �޾� ��ü�� ����ϰ� ���� �� �̿�
//@ModelAttribute�� "���� ������" �����ڸ� ã�� ��ü�� ���� �� �ʱ�ȭ(Ȯ���ϰ� ã������ ���)
	@PostMapping("/member/insert")
	public String insertMember(@ModelAttribute MemberDto dto) {
		dao.insertMember(dto);
		//insert ������ ���ΰ�ħ�ϸ� �Ȱ��� ������ ���°� ���������� redirect�� �����
		//redirect�� �����ּҷ�
		return "redirect:/member/list";
	}
}
