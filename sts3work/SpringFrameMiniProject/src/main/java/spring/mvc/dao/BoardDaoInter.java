package spring.mvc.dao;

import java.util.List;

import spring.mvc.dto.BoardDto;

public interface BoardDaoInter {
	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup, int restep);
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getList(int start,int perpage);
	public BoardDto getOneData(int num);
	public void updateReadCount(int num);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num); 
	public List<BoardDto> getAjaxList();
}
