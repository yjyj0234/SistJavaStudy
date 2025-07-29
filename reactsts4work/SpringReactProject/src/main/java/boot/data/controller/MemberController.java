package boot.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapper;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/")
public class MemberController {
	@Autowired
	MemberMapper memberMapper;
	
	@PostMapping("/member/insert")
	public void insertMember(@RequestBody MemberDto dto) {
		memberMapper.insertMember(dto);
	}
	
	@GetMapping("/member/list")
	public List<MemberDto> list(){
		return memberMapper.getAllMembers();
	}
	
	@DeleteMapping("/member/delete")
	public void delete(@RequestParam("num") int num) {
		memberMapper.deleteMember(num);
	}
	
	//중복체크
	@GetMapping("/member/idcheck")
	public int idcheck(@RequestParam("myid") String myid) {
		return memberMapper.getSearchId(myid);
	}
	
	//로그인체크(맵으로 넣었음, string integer 섞여있어서 object) 
	@PostMapping("/login/check")
	public Map<String, Object> login(@RequestBody MemberDto dto){
		Map<String, String> map=new HashMap<>();
		map.put("myid", dto.getMyid());
		map.put("mypass", dto.getMypass());
		System.out.println("myid="+dto.getMyid());
		
		Map<String, Object> result=new HashMap<>();
		int check=memberMapper.getLogin(map);
		result.put("check", check);
		
		if(check==1) {
			//로그인 성공시 이름 넘기기
			String myname=memberMapper.getName(dto.getMyid());
			result.put("myname", myname);
		}else {
			result.put("myname", null);
		}
		
		return result;
	}
	
}
