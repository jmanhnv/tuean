package com.tuean.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.tuean.model.AbstractEntity;

public abstract class GenericDao<T extends AbstractEntity> {
	@Autowired
	protected JdbcTemplate jdbcTemplate;

	public void insert(String sql, Object... args) {

	}

	public void update(String sql, Object... args) {

	}

	public void delete(Integer id) {

	}

	public T findById(Integer id) {
		return null;
	}

	public List<T> findAll() {
		return null;
	}
}
