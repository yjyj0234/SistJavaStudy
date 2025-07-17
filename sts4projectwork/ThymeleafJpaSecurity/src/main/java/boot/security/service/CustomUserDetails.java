package boot.security.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import boot.security.dto.UserEntity;

public class CustomUserDetails implements UserDetails {
	
	
	private UserEntity userEntity;
	public CustomUserDetails(UserEntity userEntity) {
		this.userEntity=userEntity;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Collection<GrantedAuthority> collection=new ArrayList<>();
		collection.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				// TODO Auto-generated method stub
				return userEntity.getRole();
			}
		});
		
		return collection;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return userEntity.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userEntity.getUsername();
	}
	@Override
	public boolean isEnabled() {  //인증했는데 기간이 만료된 경우
		// TODO Auto-generated method stub
		return UserDetails.super.isEnabled();
	}
}
