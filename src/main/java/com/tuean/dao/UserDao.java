package com.tuean.dao;

import com.tuean.dto.UserDto;

public interface UserDao {
	UserDto loadUserByEmailPwd(String email, String password);

	UserDto findByEmail(String email);
}
