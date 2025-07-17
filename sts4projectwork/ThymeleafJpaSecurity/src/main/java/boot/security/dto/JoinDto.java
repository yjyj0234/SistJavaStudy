package boot.security.dto;

import jakarta.persistence.Entity;
import lombok.Data;

@Data
public class JoinDto {
	
	private String username;
	private String password;
	//해당 롤에 대한 권한이 있는지
	private String role;
}
