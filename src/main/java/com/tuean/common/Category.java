package com.tuean.common;

public enum Category {
	BAN_CONG(1, "ban_cong"), //
	CAU_THANG(2, "cau_thang"), //
	MAI_KINH(3, "mai_kinh"), //
	CONG_CUA(4, "cong_cua"), //
	HANG_RAO(5, "hang_rao");

	private int key;
	private String name;

	private Category(int key, String name) {
		this.key = key;
		this.name = name;
	}

	public int getKey() {
		return key;
	}

	@Override
	public String toString() {
		return name;
	}

}
