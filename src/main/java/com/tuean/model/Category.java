package com.tuean.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "ta_mst_category")
public class Category extends AbstractEntity {
	private static final long serialVersionUID = -359248035971954233L;

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
