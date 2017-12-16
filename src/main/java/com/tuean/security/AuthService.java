package com.tuean.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.tuean.dao.UserDao;
import com.tuean.dto.UserDto;

@Service
public class AuthService implements UserDetailsService {
	@Autowired
	private UserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		UserDto user = userDao.findByEmail(email);
		if (user == null) throw new UsernameNotFoundException("User " + email + " was not found in the database");

		// [USER,ADMIN,..]
		List<GrantedAuthority> authorities = Lists.newArrayList();
		if (!Strings.isNullOrEmpty(user.getRoleName())) {
			// ROLE_USER, ROLE_ADMIN,..
			GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + user.getRoleName());
			authorities.add(authority);
		}

		UserDetails userDetails = (UserDetails) new User(user.getEmail(), user.getPassword(), authorities);
		return userDetails;
	}

}
