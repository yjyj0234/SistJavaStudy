package boot.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import boot.security.dto.JoinDto;
import boot.security.dto.UserEntity;

@Service
public class JoinService {
	@Autowired
	private UserRepository userRepository;
	
	//패스워드 암호화
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public void joinProcess(JoinDto joinDto) {
		
		//db에 이미 동일한 username을 체크해줌
		boolean isUser=userRepository.existsByUsername(joinDto.getUsername());
		
		if(isUser) {
			System.out.println(joinDto.getUsername()+"님은 이미 존재함");
			return ;
		}else {
			System.out.println(joinDto.getUsername()+" DB저장!");
		}
		UserEntity data=new UserEntity();
		data.setUsername(joinDto.getUsername());
		//암호화한 다음 패스워드에 넣기
		data.setPassword(bCryptPasswordEncoder.encode(joinDto.getPassword()));
		data.setRole(joinDto.getRole());
		
		userRepository.save(data);
	}
}
