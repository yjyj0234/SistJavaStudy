package spring.mvc.controller;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.MemberDaoInter;
import spring.mvc.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	MemberDaoInter dao;  //�޼��� �ڵ�����
	
	//�������Ʈ
		@GetMapping("/member/list")
		public String memberList(Model model) {
			List<MemberDto> list=dao.getAllMembers();
			model.addAttribute("list",list);
			return "/member/memberlist";
		}
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
	
	//����������
	
	@GetMapping("/member/myinfo")
	public String mypage(Model model) {
		List<MemberDto> list=dao.getAllMembers();
		model.addAttribute("list",list);
		return "/member/myinfo";
	}
	
	//������ @ModelAttribute�� dto ������ ���� 
	@GetMapping("/member/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView model=new ModelAndView();
		MemberDto dto=dao.getMember(num);
		model.addObject("dto", dto);
		model.setViewName("/member/myupdateform");
		return model;
	}
	
	//�����ϱ�
	@PostMapping("/member/update")
	public String updateMember(@ModelAttribute MemberDto dto) {
		int n=dao.updatePassCheck(dto.getNum(), dto.getPass());
		if(n==1) {
			dao.updateMember(dto);
			return "redirect:/member/list";
		}else {
			return "/member/passfail";
		}
	}
	@GetMapping("/member/delete")
	public String deleteMember(@RequestParam String num,
			HttpSession session) {
		dao.deleteMember(num);
		session.invalidate();
		return "redirect:/home";
	}
	//@ResponseBody ������ ���� �ʿ�
	@GetMapping("/member/ban")
	@ResponseBody
	public void ban(@RequestParam String num) {
		
		dao.banMember(num);
	}
}
