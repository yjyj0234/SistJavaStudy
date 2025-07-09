package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.tags.shaded.org.apache.bcel.generic.NEW;
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
import org.springframework.web.bind.annotation.RequestBody;


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
	
	//마이페이지에서 프로필 사진만 변경하고자 할때
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void updatePho(String num,MultipartFile photo,
			HttpSession session) {
		//업로드될 경로 구하기
		String path=session.getServletContext().getRealPath("/membersave");
		System.out.println(path);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+photo.getOriginalFilename();
		
		//업로드
		try {
			photo.transferTo(new File(path+"\\"+fileName));
			//db수정
			service.updatePhoto(num, fileName);
			
			//상단 프로필 사진도 변경
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//num값 가져와서 데이터 불러오기
	/*
	 * @GetMapping("/member/getdata") public Model getDataByNum(String num,Model
	 * model) { MemberDto dto=service.getDataByNum(num); model.addAttribute("ldto",
	 * dto); return model; }
	 */
	
	//수정
	//넘어가는 값이 void여도 ajax때문에 @ResponseBody를 써줘야한다 
	@PostMapping("/member/update")
	@ResponseBody
	public void memberUpdate(@ModelAttribute MemberDto dto,HttpSession session) {
		//TODO: process POST request
		
		service.updateMember(dto);
		//세션에 저장된 이름도 수정
		session.setAttribute("loginname", dto.getName());
	}
	
	
}
