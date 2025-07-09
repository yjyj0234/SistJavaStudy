package boot.data.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberServiceInter {
	public int getSearchId(String id);
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	
	public String getName(String id);
	public int loginIdPass(String id,String pass); //mapper처럼 못하는이유가 type을 받아서
	public MemberDto getDataById(String id);
	
	//수정삭제
	public MemberDto getDataByNum(String num);
	public void updateMember(MemberDto dto);
	public void deleteMember(String num);
	//사진수정
	public void updatePhoto(String num,String photo);
}
