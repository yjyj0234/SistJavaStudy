package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	public int getSearchId(String id);
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	
	public String getName(String id);
	public int loginIdPass(String id,String pass); //mapper처럼 못하는이유가 type을 받아서
	public MemberDto getDataById(String id);
}
