package com.tuean.service;

import com.tuean.dto.UserDto;

public interface UserService {
	UserDto loadUserByEmailPwd(String email, String password);
}
