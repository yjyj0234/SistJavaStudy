package data.thyme.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.thyme.dto.ShopDto;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	List<ShopDto> list=new ArrayList<>();
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/hello1")
	public String hello(Model model) {
		model.addAttribute("message","Have a Nice Day");
		model.addAttribute("today",new Date());
		
		ShopDto dto=ShopDto.builder()
				.num(100)
				.sangpum("아이폰16")
				.su(5)
				.dan(15000000)
				.color("beige")
				
				.build();
		
		model.addAttribute("dto",dto);
		
		return "hello1";
	}
	@GetMapping("/hello2")
	public String hello2(@RequestParam("name") String name,@RequestParam("ban")int ban, Model model) {
		model.addAttribute("studata",name+"님은 " +ban+"강의장 학생입니다");
		
		return "hello2";
	}
	@GetMapping("/list")
	public String list(Model model) {
		list.add(new ShopDto(1,"진주귀걸이",2,15000,"white"));
		list.add(new ShopDto(3,"진주목걸이",2,25000,"gold"));
		list.add(new ShopDto(6,"진주팔걸이",3,55000,"black"));
		list.add(new ShopDto(77,"행주걸이",1,5000,"darkred"));
		list.add(new ShopDto(12,"전주비빔밥",6,10000,"green"));
		
		ShopDto dto2=ShopDto.builder()
				.num(5)
				.sangpum("반팔티")
				.su(20)
				.dan(25000)
				.color("gray")
				.build();
		list.add(dto2);
		model.addAttribute("list",list);
		
		return "list";
	}
	@GetMapping("/detail")
	public String detail(@RequestParam("index") int index,Model model) {
		model.addAttribute("dto",list.get(index));
		return "detail";
	}
	@GetMapping("/login1")
	public String login1(HttpSession session) {
		session.setAttribute("myid", "admin");
		return "login";
	}
	@GetMapping("/login2")
	public String login2(HttpSession session) {
		session.setAttribute("myid", "yjyj0345");
		return "login";
	}
}
