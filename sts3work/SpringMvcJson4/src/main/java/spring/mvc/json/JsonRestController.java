package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mvc.dto.FoodDto;

//json전용(일반메서드 안됨) 5.0이후에 추가된 기능
@RestController
public class JsonRestController {
	
	
	@GetMapping("list3")
	public Map<String, String> list3(@RequestParam String name){

		List<FoodDto> list= new ArrayList<FoodDto>();
		list.add(new FoodDto("샌드위치", "1.jpg"));
		list.add(new FoodDto("망고빙수", "11.jpg"));
		list.add(new FoodDto("순두부열라면", "12.jpg"));
		list.add(new FoodDto("햄에그샌드위치", "8.jpg"));
		list.add(new FoodDto("콘치즈", "5.jpg"));
		list.add(new FoodDto("꼬치","2.jpg"));
		
		//맵이 인터페이스여서 hashmap으로
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "없는메뉴");
		map.put("photo", "man.png");
		
		for(FoodDto dto:list) {
			if(name.equals(dto.getName())) {
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		return map;
		
	}
	
}
