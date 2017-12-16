package com.tuean.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ta_product_detail")
public class ProductDetail extends AbstractEntity {
	private static final long serialVersionUID = -7455478016557128401L;

	// @Column(name = "product_id")
	// private Integer productId;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, optional = true)
	@JoinColumn(name = "product_id", referencedColumnName = "id")
	private Product product;

	private Double width;

	private Double heigth;

	private String unit;

	@Column(name = "unit_price")
	private Double unitPrice;

	private Integer quantiy;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "offer_id", nullable = true)
	private Offer offer;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Double getWidth() {
		return width;
	}

	public void setWidth(Double width) {
		this.width = width;
	}

	public Double getHeigth() {
		return heigth;
	}

	public void setHeigth(Double heigth) {
		this.heigth = heigth;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantiy() {
		return quantiy;
	}

	public void setQuantiy(Integer quantiy) {
		this.quantiy = quantiy;
	}

	public Offer getOffer() {
		return offer;
	}

	public void setOffer(Offer offer) {
		this.offer = offer;
	}

}
