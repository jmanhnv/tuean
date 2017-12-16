package com.tuean.common;

/**
 * Defined kind of people.
 * 
 * <pre>
 * Mr, Mrs, Ms, Ph...
 * </pre>
 * 
 * @author jnguyen
 */
public enum Title {
	MR(0, "Mr"), MS(1, "Ms"), MRS(2, "Mrs"), PH(3, "Ph");

	private int key;
	private String value;

	private Title(int key, String value) {
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
