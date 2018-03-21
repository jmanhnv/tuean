package com.tuean.common;

import com.tuean.util.ConstUtil;

public final class Helper implements ConstUtil {
	public static String getCategoryNameById(int categoryId) {
		for (Category cat : Category.values()) {
			if (categoryId == cat.getKey()) return cat.toString();
		}
		return null;
	}

}
