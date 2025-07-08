package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;
import boot.data.service.MemberServiceInter;
import jakarta.servlet.http.HttpSession;

@RestController
public class LoginController {
	@Autowired
	MemberService service;
	
	@GetMapping("/member/login")
	public Map<String, String> loginprocess(String id, String pass,
			HttpSession session){
		Map<String, String> map=new HashMap<>();
		int loginresult=service.loginIdPass(id, pass);
		if(loginresult==1) {
			//아이디 비번 모두 맞는경우
			session.setMaxInactiveInterval(60*60*4);
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			MemberDto mdto=service.getDataById(id);
			session.setAttribute("loginname", mdto.getName());
			session.setAttribute("loginphoto", mdto.getPhoto());
		}
		map.put("result", loginresult==1?"success":"fail");
		
		return map;
	}
	@GetMapping("/member/logout")
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
