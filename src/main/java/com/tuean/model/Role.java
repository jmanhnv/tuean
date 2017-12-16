package com.tuean.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ta_mst_role")
public class Role extends AbstractEntity {
	private static final long serialVersionUID = -3255102798314286844L;

	public static final String ROLE_ID = "role_id";
	public static final String ROLE_NAME = "role_name";

	private String name;

	private String description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
