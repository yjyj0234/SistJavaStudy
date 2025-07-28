package boot.data.controller;

import java.util.List;

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
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberMapper memberMapper;
	
	@PostMapping("/insert")
	public void insertMember(@RequestBody MemberDto dto) {
		memberMapper.insertMember(dto);
	}
	
	@GetMapping("/list")
	public List<MemberDto> list(){
		return memberMapper.getAllMembers();
	}
	
	@DeleteMapping("/delete")
	public void delete(@RequestParam("num") int num) {
		memberMapper.deleteMember(num);
	}
	
	//중복체크
	@GetMapping("/idcheck")
	public int idcheck(@RequestParam("myid") String myid) {
		return memberMapper.getSearchId(myid);
	}
}
