package com.tuean.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.tuean.util.DateCfg;

@MappedSuperclass
public abstract class AbstractEntity implements Serializable {
	private static final long serialVersionUID = 4320864524158503852L;

	@Id
	// @GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected Integer id;

	@Column(name = "created_date")
	@Temporal(TemporalType.DATE)
	private Date createdDate;

	@Column(name = "updated_date")
	@Temporal(TemporalType.DATE)
	private Date updatedDate;

	public AbstractEntity() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	@PrePersist
	public void prePersist() {
		// FIXME - do something
		this.createdDate = DateCfg.getSysDate();
		this.updatedDate = DateCfg.getSysDate();
	}

	@PreUpdate
	public void preUpdate() {
		// FIXME - do something
		this.updatedDate = DateCfg.getSysDate();
	}

	@PreRemove
	public void preRemove() {
		// FIXME - do something
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		if (getClass() != obj.getClass()) return false;
		AbstractEntity other = (AbstractEntity) obj;
		if (id != other.id) return false;
		return true;
	}

}
