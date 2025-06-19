package spring.mvc.coffee;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.TestDto;

@Controller
public class FormController {
	
	@GetMapping("/data/myform")
	public String form() {
		
		return "data/form1";
	}
	
	@GetMapping("/data/read1")
	//���� ����(��ȣ��..)�� �����༭ �Ѿ���°��� �ʿ���->@RequestParam
								//@RequestParam("name")�� ����
	
	//400�� ������ ���°��(���� ���� ���� �Ѱܾ� �� ��): �� �����ٰ�
	//required=false�� �ְų� defaultvalue���� �־���� 
	public ModelAndView read1(@RequestParam String name,
			@RequestParam int age,
			@RequestParam String addr,
			//@RequestParam (required=false) String msg) �Ǵ� 
			@RequestParam(value="msg",defaultValue = "Happy Day!!!") String msg)
	{
		ModelAndView model=new ModelAndView();
		
		//request�� ����
		model.addObject("name", name);
		model.addObject("age", age);
		model.addObject("addr", addr);
		model.addObject("msg", msg);
		
		//������
		model.setViewName("data/process1");
		
		return model;
	}
	
	//post����̶� post ����
	//@ModelAttribute : dto�� �ѹ��� �о��
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute TestDto dto) {
		ModelAndView model=new ModelAndView();
		
		model.addObject("dto", dto);
		model.setViewName("data/process2");
		
		return model;
	}
	
	@PostMapping("/data/read3")
										//key��, value�� string ���� �ްڴ�
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		ModelAndView model = new ModelAndView();
		
		String sang= map.get("sang");
		String cate= map.get("category");
		String price=map.get("price"); //�ʿ�� ����ȯ
		
		String data=sang+"�� ī�װ��� "+cate+"�̸� ������ "+price+"�� �Դϴ�";
		
		model.addObject("data", data);
		model.setViewName("data/process3");
		
		return model;
	}
}
