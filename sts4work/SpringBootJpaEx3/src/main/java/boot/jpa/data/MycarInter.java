package boot.jpa.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MycarInter extends JpaRepository<MycarDto, Long>{
	//jpa리포지토리
}
