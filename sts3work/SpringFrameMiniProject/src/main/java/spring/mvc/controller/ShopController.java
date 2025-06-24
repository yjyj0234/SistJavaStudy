package spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dao.MyshopDao;
import spring.mvc.dto.MyshopDto;

@Controller
public class ShopController {
	
	//dao 자동으로 불러오는 기능
	@Autowired
	MyshopDao dao;
	
	/*
	 * @GetMapping("/shop/list") public ModelAndView shopList() {
	 * 
	 * ModelAndView model=new ModelAndView();
	 * 
	 * List<MyshopDto> list=dao.getAllSangpums();
	 * 
	 * model.addObject("size", list.size()); 
	 * model.setViewName("myshop/shoplist");
	 * 
	 * return model; }
	 */
}
