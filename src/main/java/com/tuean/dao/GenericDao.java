package com.tuean.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.tuean.model.AbstractEntity;

@SuppressWarnings({ "unchecked", "rawtypes" })
public abstract class GenericDao<T extends AbstractEntity> {
	@Autowired
	protected JdbcTemplate jdbcTemplate;

	/**
	 * Method use to execute {insert | update | delete} query.
	 * 
	 * @param sql
	 * @param args
	 */
	public void executeQuery(String sql, Object... args) {
		jdbcTemplate.update(sql, args);
		System.out.println("insert | update | delete was Added | Updated | Deleted!!");
	}

	/**
	 * Method use to find object by id as primary key.
	 * 
	 * @param sql
	 * @param id
	 * @return
	 */
	public T findById(String sql, Integer id, Class<T> clazz) {
		return (T) jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper(clazz));
	}

	/**
	 * Method use to find all objects by id as primary key.
	 * 
	 * @return
	 */
	public List<T> findAll(String sql, Class<T> clazz) {
		return (List<T>) jdbcTemplate.queryForList(sql, new BeanPropertyRowMapper(clazz));
	}

}
