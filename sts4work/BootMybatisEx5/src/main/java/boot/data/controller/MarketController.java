package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MarketDto;
import boot.data.mapper.MarketMapperInter;
import jakarta.servlet.http.HttpSession;
@Controller
public class MarketController {
	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping({"/","list"})
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		
		List<MarketDto> list=mapper.getAllSangpums();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list",list);
		model.setViewName("market/marketlist"); //포워드
		
		return model;
	}
	@GetMapping("/insertform")
	public String form() {
		return "market/addform";
	}
	
	@PostMapping("/insert")
	public String insertMarket(@ModelAttribute MarketDto dto,@RequestParam MultipartFile photo,
			HttpSession session) {
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		}else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+"_"+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mapper.InsertOfMarket(dto);
		//리다이렉트
		return "redirect:list";
	}
	@GetMapping("/updateform")
	public ModelAndView updateform(@RequestParam int num) {
		ModelAndView model=new ModelAndView();
		MarketDto dto=mapper.getOneSangpum(num);
		model.addObject("dto", dto);
		model.setViewName("market/updateform");
		return model;
	}
	@PostMapping("/update")
	public String update(@ModelAttribute MarketDto dto,@RequestParam MultipartFile photo,
			HttpSession session) {
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		}else {
			//이전사진 지우기
			String pre_photo=mapper.getOneSangpum(dto.getNum()).getPhotoname();
			File file=new File(path+"\\"+pre_photo);
			file.delete();
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname=sdf.format(new Date())+"_"+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mapper.updateMarket(dto);
		//리다이렉트
		return "redirect:list";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int num,
			HttpSession session) {
		String path=session.getServletContext().getRealPath("/photo");
		String photo=mapper.getOneSangpum(num).getPhotoname();
		File file=new File(path+"\\"+photo);
		if(file.exists()) {
			file.delete();
		}
		mapper.deleteMarket(num);
		return "redirect:list";
	}
}
