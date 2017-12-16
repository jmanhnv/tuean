package com.tuean.util;

import java.util.List;

public final class CollectsUtil {
	private CollectsUtil() {
	}

	public static boolean isEmpty(List<?> collects) {
		return collects != null && collects.isEmpty();
	}
}
