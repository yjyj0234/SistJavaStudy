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
	
	//로그인
	@PostMapping("/login/loginprocess")
	public String logincheck(HttpSession session,
			@RequestParam String id,
			@RequestParam String pass) {
		//메서드 int로 선언했으니 int로 변수선언
		int n=dao.loginCheck(id, pass);
		if(n==1) {
			//세션 저장
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			
			//메인페이지로 리다이렉트
			return "redirect:/home";
		}else {
			
			//실패시
			return "/login/loginfail";
		}
	}
	
	//로그아웃은 세션만 지우면 됨
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.invalidate();
		return "redirect:/home";
	}
}
