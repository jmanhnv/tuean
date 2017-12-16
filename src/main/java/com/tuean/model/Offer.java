package com.tuean.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ta_offer")
public class Offer extends AbstractEntity {
	private static final long serialVersionUID = 8545719707452053604L;

	// @Column(name = "product_detail_id")
	// private Integer productDetailId;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "offer")
	private Set<ProductDetail> productDetails;

	@Column(name = "estimate_price")
	private Double estimatePrice;

	private String description;

	public Set<ProductDetail> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(Set<ProductDetail> productDetails) {
		this.productDetails = productDetails;
	}

	public Double getEstimatePrice() {
		return estimatePrice;
	}

	public void setEstimatePrice(Double estimatePrice) {
		this.estimatePrice = estimatePrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
