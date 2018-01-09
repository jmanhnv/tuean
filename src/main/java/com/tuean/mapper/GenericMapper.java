package com.tuean.mapper;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;

import com.tuean.model.AbstractEntity;

public class GenericMapper<T extends AbstractEntity> extends BeanPropertyRowMapper<T> implements RowMapper<T> {
}
