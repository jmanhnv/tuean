package com.tuean.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuean.dao.UserDao;
import com.tuean.dto.UserDto;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public UserDto loadUserByEmailPwd(String email, String password) {
		return userDao.loadUserByEmailPwd(email, password);
	}
}
