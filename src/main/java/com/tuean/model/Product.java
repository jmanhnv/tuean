package com.tuean.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ta_product")
public class Product extends AbstractEntity {
	private static final long serialVersionUID = -6525050382232853501L;

	private String name;

	// @Column(name = "file_id")
	// private Integer fileId;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "file_id")
	private File file;

	// @Column(name = "category_id")
	// private Integer categoryId;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private Category category;

	private String description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
