package thyme.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import thyme.data.dto.ShopDto;
import thyme.data.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	ShopService service;
	
	@GetMapping("/shop/list")
	public String shopList(Model model) {
		int count=service.getTotalCount();
		List<ShopDto> list=service.getAllDatas();
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		return "shop/list";
	}
	
	@GetMapping("/shop/add")
	public String add() {
		return "shop/addform";
	}
	@PostMapping("/shop/insert")
	public String shopInsert(@ModelAttribute ShopDto dto,
			@RequestParam("upload") MultipartFile upload,HttpSession session) {
		service.insertMyshop(dto, upload, session);
		return "redirect:list";
	}
	@GetMapping("/shop/detail")
	public String shopDetail(@RequestParam("num") int num,Model model) {
		ShopDto dto=service.getData(num);
		model.addAttribute("dto", dto);
		return "shop/shopdetail";
	}
	
	@GetMapping("/shop/delete")
	public String shopDelete(@RequestParam("num") int num,
			HttpSession session) {
		service.deleteShop(num, session);
		return "redirect:list";
				
	}
}
