package com.tuean.common;

/**
 * Defined type of customer.
 * 
 * <pre>
 * 0 - Personal; 1 - Organization
 * </pre>
 * 
 * @author jnguyen
 */
public enum CustomerType {
	PERSONAL(0, "Personal"), ORGANIZATION(1, "Organization");

	private int key;
	private String value;

	private CustomerType(int key, String value) {
		this.key = key;
		this.value = value;
	}

	public int getKey() {
		return key;
	}

	public String getValue() {
		return value;
	}

}
