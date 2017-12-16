package com.tuean.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ta_order")
public class Order extends AbstractEntity {
	private static final long serialVersionUID = 6203055727244233286L;

	// @Column(name = "offer_id")
	// private Integer offerId;

	// @Column(name = "customer_id")
	// private Integer customerId;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "offer_id")
	private Offer offer;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_id")
	private Customer customer;

	private String description;

	public Offer getOffer() {
		return offer;
	}

	public void setOffer(Offer offer) {
		this.offer = offer;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
