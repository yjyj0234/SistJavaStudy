package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.dto.FoodDto;

@Controller
public class JsonTestController {
	
	@GetMapping("/list1")
	@ResponseBody
	public Map<String, String> list1(){
		Map<String, String> map= new HashMap<String, String>();
		map.put("name", "홍길동");
		map.put("hp", "010-222-3333");
		map.put("addr", "서울 강남 역삼");

		return map;
	}
	@GetMapping("/list2")
	//비동기 방식
	@ResponseBody
	public List<FoodDto> list2(){
		List<FoodDto> list=new ArrayList<FoodDto>();
		list.add(new FoodDto("샌드위치", "1.jpg"));
		list.add(new FoodDto("망고빙수", "11.jpg"));
		list.add(new FoodDto("순두부열라면", "12.jpg"));
		list.add(new FoodDto("햄에그샌드위치", "8.jpg"));
		list.add(new FoodDto("콘치즈", "5.jpg"));
		
		return list;
	}
	
}
