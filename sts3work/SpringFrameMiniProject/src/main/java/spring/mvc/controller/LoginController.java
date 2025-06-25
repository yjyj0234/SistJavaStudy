package spring.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.dao.MemberDao;

@Controller
public class LoginController {
	@Autowired
	MemberDao dao;
	
	//�α���
	@PostMapping("/login/loginprocess")
	public String logincheck(HttpSession session,
			@RequestParam String id,
			@RequestParam String pass) {
		//�޼��� int�� ���������� int�� ��������
		int n=dao.loginCheck(id, pass);
		if(n==1) {
			//���� ����
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			
			//������������ �����̷�Ʈ
			return "redirect:/home";
		}else {
			
			//���н�
			return "/login/loginfail";
		}
	}
	
	//�α׾ƿ��� ���Ǹ� ����� ��
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.invalidate();
		return "redirect:/home";
	}
}
