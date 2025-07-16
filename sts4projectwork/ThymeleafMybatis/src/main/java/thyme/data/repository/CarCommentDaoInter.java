package thyme.data.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import thyme.data.dto.CarCommentDto;

public interface CarCommentDaoInter extends JpaRepository<CarCommentDto, Integer>{
	
	@Query(value = "select * from jpacar_comment where num=:num order by idx desc",nativeQuery = true)
	public List<CarCommentDto> getJpaCarCommentList(@Param("num") Long num);
}
