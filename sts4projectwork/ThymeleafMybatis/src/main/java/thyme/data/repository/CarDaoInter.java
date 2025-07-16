package thyme.data.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import jakarta.transaction.Transactional;
import thyme.data.dto.CarDto;

public interface CarDaoInter extends JpaRepository<CarDto, Long>{

	//직접 쿼리문 작성
	//자동차명, 가격, 색상만 수정 하는 메서드를 만들어보기
	
	//@param:쿼리문에서만 쓸수있음(num값과 쿼리문을 연결해주기위한 장치)
	@Query(value = "update jpacar set carname=:carname,carprice=:carprice,carcolor=:carcolor where num=:num",
		nativeQuery = true)
	/*
	 * @Query(value =
	 * "update jpacar c set c.carname=:carname,c.carprice=:carprice,c.carcolor=:carcolor where num=:num"
	 * , nativeQuery = true)
	 */
	@Modifying			//insert, update, delete 할때 붙여줌
	@Transactional 		//update, delete 할때 붙여줌
	public void updateCarNoPhoto(@Param("num") Long num,
			@Param("carname") String carname,@Param("carprice") int carprice,
			@Param("carcolor") String carcolor);
	
}
