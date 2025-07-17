package boot.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import boot.security.dto.UserEntity;

@Service
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserEntity userData=userRepository.findByUsername(username);
		
		//존재하는경우
		if(userData!=null) {
			System.out.println(username+" 아이디가 DB에 존재함!");
			return new CustomUserDetails(userData);
		}else {
			System.out.println(username+" 아이디가 존재하지 않음");
			throw new UsernameNotFoundException(username+"아이디가 DB에 존재하지 않아요");
		}
		
		
	}

}
