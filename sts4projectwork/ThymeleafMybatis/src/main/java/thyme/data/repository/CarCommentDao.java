package thyme.data.repository;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import thyme.data.dto.CarCommentDto;

@Repository
@AllArgsConstructor
public class CarCommentDao {
	private final CarCommentDaoInter commentInter;
	
	//댓글 저장
	public void insertCommentCar(CarCommentDto dto) {
		commentInter.save(dto);
	}
	//댓글 목록
	public List<CarCommentDto> getJpaCarCommentList(@RequestParam("num") Long num){
		
		return commentInter.getJpaCarCommentList(num);
	}

}
