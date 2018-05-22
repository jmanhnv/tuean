package com.tuean.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tuean.common.Category;
import com.tuean.common.Helper;

public final class ImageUtil implements ConstUtil {
	public static final int WIDTH = 720;
	public static final int HEIGHT = 480;
	public static final int WIDTH_2X = 1440;
	public static final int HEIGHT_2X = 960;
	public static final String SUBFIX = "@2x";

	public static final String BC_FOLDER = UPLOADED_FOLDER + FILE_SEPARATOR + Category.BAN_CONG;
	public static final String CT_FOLDER = UPLOADED_FOLDER + FILE_SEPARATOR + Category.CAU_THANG;
	public static final String MK_FOLDER = UPLOADED_FOLDER + FILE_SEPARATOR + Category.MAI_KINH;
	public static final String CC_FOLDER = UPLOADED_FOLDER + FILE_SEPARATOR + Category.CONG_CUA;
	public static final String HR_FOLDER = UPLOADED_FOLDER + FILE_SEPARATOR + Category.HANG_RAO;

	static {
		// BAN_CONG
		File f = new File(BC_FOLDER);
		if (!f.exists())
			f.mkdirs();

		// CAU_THANG
		f = new File(CT_FOLDER);
		if (!f.exists())
			f.mkdirs();

		// MAI_KINH
		f = new File(MK_FOLDER);
		if (!f.exists())
			f.mkdirs();

		// CONG_CUA
		f = new File(CC_FOLDER);
		if (!f.exists())
			f.mkdirs();

		// HANG_RAO
		f = new File(HR_FOLDER);
		if (!f.exists())
			f.mkdirs();
	}

	/**
	 * Method use to resize dimension for normal size (default) mode and view detail size mode.
	 * 
	 * @param file
	 *            current file upload
	 * @param categoryId
	 *            the category to upload file
	 * @param width
	 *            the width will be resized
	 * @param height
	 *            the height will be resized
	 * @throws IOException
	 *             exception throws when error
	 */
	public static void resizeImage(final MultipartFile file, int categoryId, final int width, final int height,
			final String newFileName) throws IOException {
		BufferedImage originalImage = ImageIO.read(file.getInputStream());
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

		BufferedImage resizedImage = new BufferedImage(width, height, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, width, height, null);
		g.dispose();

		String fName = newFileName;
		final String extension = FilenameUtils.getExtension(fName);
		if (WIDTH_2X == width && HEIGHT_2X == height)
			fName = fName.replace(DOT + extension, SUBFIX + DOT + extension);

		ImageIO.write(resizedImage, extension, new File(Helper.getLocalPathByCategoryId(categoryId) + fName));
	}

	private ImageUtil() {
	}
}
