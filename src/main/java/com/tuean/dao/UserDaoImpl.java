package com.tuean.dao;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tuean.dto.UserDto;
import com.tuean.mapper.UserMapper;
import com.tuean.model.User;

@Repository
// @Repository("userDao")
@Transactional
@Qualifier("userDao")
public class UserDaoImpl extends GenericDao<User> implements UserDao {

	@Override
	public UserDto loadUserByEmailPwd(String email, String password) {
		String sql = "SELECT r.id as user_id, u.name, u.email, u.password, r.name as role_name, r.id as role_id FROM ta_user u"
				+ " INNER JOIN ta_mst_role r ON r.id = u.role_id WHERE u.email = ? AND u.password = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { email, password }, new UserMapper());
	}

	@Override
	public UserDto findByEmail(String email) {
		String sql = "SELECT r.id as user_id, u.name, u.email, u.password, r.name as role_name, r.id as role_id FROM ta_user u"
				+ " INNER JOIN ta_mst_role r ON r.id = u.role_id WHERE u.email = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { email }, new UserMapper());
	}

}
