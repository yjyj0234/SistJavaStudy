package boot.security.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import boot.security.dto.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer>{
	public boolean existsByUsername(String username);
	public UserEntity findByUsername(String username);
}
