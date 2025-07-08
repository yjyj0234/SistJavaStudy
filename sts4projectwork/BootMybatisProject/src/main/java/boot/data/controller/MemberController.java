package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

    private final IpgoController ipgoController;
	@Autowired
	MemberService service;

    MemberController(IpgoController ipgoController) {
        this.ipgoController = ipgoController;
    }
	
	@GetMapping("/member/form")
	public String memform() {
		return "member/addform";
	}
	
	@GetMapping("/member/list")
	public String memlist(Model model) {
		List<MemberDto> list=service.getAllMembers();
		model.addAttribute("list",list);
		model.addAttribute("count", list.size());
		
		return "member/memberlist";
	}
	
	//아이디 중복체크_rest
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheckProcess(@RequestParam String id){
		Map<String, Integer> map=new HashMap<>();
		
		//id
		int idresult=service.getSearchId(id);
		map.put("idresult", idresult); //0또는 1
		
		return map;
	}
	
	//insert
	@PostMapping("/member/insert")
	public String insertMember(@ModelAttribute MemberDto dto,
			HttpSession session, MultipartFile myphoto) {
		//업로드 폴더
		String path=session.getServletContext().getRealPath("membersave");
		System.out.println(path);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+"_"+myphoto.getOriginalFilename();
		//dto의 photo에 저장
		dto.setPhoto(fileName);
		
		//dto에 저장만 되는거라 upload 따로 해줘야함
		try {
			myphoto.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.insertMember(dto);
		
		return "member/gaipsuccess";
	}
	
	@GetMapping("/member/mypage")
	public String getDataById(String idx, Model model) {
		MemberDto mdto=service.getDataById(idx);
		model.addAttribute("mdto", mdto);
		
		return "member/mypage";
	}
}
