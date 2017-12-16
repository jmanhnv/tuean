package com.tuean.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ta_order_detail")
public class OrderDetail extends AbstractEntity {
	private static final long serialVersionUID = -4900981882334557769L;

	// @Column(name = "order_id")
	// private Integer orderId;

	// @Column(name = "product_detail_id")
	// private Integer productDetailId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", nullable = false)
	private Order order;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_detail_id")
	private ProductDetail productDetail;

	private String description;

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
