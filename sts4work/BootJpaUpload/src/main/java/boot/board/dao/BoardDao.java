package boot.board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import boot.board.dto.BoardDto;

@Repository
public class BoardDao {

	@Autowired
	BoardDaoInter daoInter;
	
	//insert
	public void insertBoard(BoardDto dto) {
		daoInter.save(dto);
	}
	
	//전체 출력..최신글이 위로 올라오게
	public List<BoardDto> getAllDatas(){
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	public BoardDto getOne(Long num) {
		return daoInter.getById(num);
	}
	
	//update
	public void updateBoard(BoardDto dto) {
		daoInter.save(dto);
	}
	//delete
	public void deleteBoard(Long num) {
		daoInter.deleteById(num);
	}
}
