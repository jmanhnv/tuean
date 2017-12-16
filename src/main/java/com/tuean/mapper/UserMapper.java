package com.tuean.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.tuean.dto.UserDto;
import com.tuean.model.Role;
import com.tuean.model.User;

public class UserMapper implements RowMapper<UserDto> {
	@Override
	public UserDto mapRow(ResultSet rs, int row) throws SQLException {
		return new UserDto(rs.getInt(User.UID), rs.getString(User.UNAME), rs.getString(User.EMAIL),
				rs.getString(User.PWD), rs.getString(Role.ROLE_NAME), rs.getInt(Role.ROLE_ID));
	}

}
