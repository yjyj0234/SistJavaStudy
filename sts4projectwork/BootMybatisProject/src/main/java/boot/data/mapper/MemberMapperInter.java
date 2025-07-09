package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
	
	public int getSearchId(String id);
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public String getName(String id);
	public int loginIdPass(Map<String, String> map);
	public MemberDto getDataById(String id);
	
	
	public MemberDto getDataBynum(String num);
	public void updatePhoto(Map<String, String> map); 
	public void updateMember(MemberDto dto); 
	public void deleteMember(String num); 
}
