package com.tuean.common;

import com.tuean.service.FileServiceImpl;
import com.tuean.util.ConstUtil;

public final class Helper implements ConstUtil {
	/**
	 * Get category by category id.
	 * 
	 * @param categoryId
	 *            the category id
	 * @return actual category
	 */
	public static Category getCategoryById(final int categoryId) {
		for (Category category : Category.values())
			if (categoryId == category.getKey())
				return category;

		return null;
	}

	/**
	 * Get file path base on categoryId
	 * 
	 * @param categoryId
	 * @return file path
	 */
	public static String getLocalPathByCategoryId(final int categoryId) {
		String path;
		if (categoryId == 1)
			path = FileServiceImpl.BC_FOLDER;
		else if (categoryId == 2)
			path = FileServiceImpl.CT_FOLDER;
		else if (categoryId == 3)
			path = FileServiceImpl.MK_FOLDER;
		else if (categoryId == 4)
			path = FileServiceImpl.CC_FOLDER;
		else
			path = FileServiceImpl.HR_FOLDER;

		return path + FILE_SEPARATOR;
	}

	public static String getCategoryNameById(int categoryId) {
		return getCategoryById(categoryId).toString();
	}

}
