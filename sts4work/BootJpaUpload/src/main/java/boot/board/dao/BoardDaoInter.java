package boot.board.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import boot.board.dto.BoardDto;

public interface BoardDaoInter extends JpaRepository<BoardDto, Long> {
	//JpaRepository<BoardDto, Long> 자체에 메서드 상속중
}
