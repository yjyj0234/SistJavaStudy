package spring.mvc.dao;

import spring.mvc.dto.MemberDto;

public interface MemberDaoInter {
	public int getIdCount(String id);
	public void insertMember(MemberDto dto); 
}
