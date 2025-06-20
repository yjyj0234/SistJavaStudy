package spring.board.data;

import java.util.List;

public interface BoardDaoInter {
	
	public int getTotalCount();
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getAllDatas();
	public BoardDto getOneData(String num);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(String num);
}
