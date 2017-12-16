package com.tuean.common;

/**
 * Defined status.
 * 
 * <pre>
 * 0 - Active; 1 - Inactive
 * </pre>
 * 
 * @author jnguyen
 */
public enum Status {
	ACTIVE(0, "Active"), INACTIVE(1, "Inactive");

	private int key;
	private String value;

	private Status(int key, String value) {
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
