package com.tuean.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tuean.common.Helper;

public final class ImageUtil implements ConstUtil {
	public static final int WIDTH = 720;
	public static final int HEIGHT = 480;
	public static final int WIDTH_2X = 1440;
	public static final int HEIGHT_2X = 960;
	public static final String SUBFIX = "@2x";

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
	public static void resizeImage(final MultipartFile file, int categoryId, final int width, final int height)
			throws IOException {
		BufferedImage originalImage = ImageIO.read(file.getInputStream());
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

		BufferedImage resizedImage = new BufferedImage(width, height, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, width, height, null);
		g.dispose();

		String fName = file.getOriginalFilename();
		if (WIDTH_2X == width && HEIGHT_2X == height)
			fName = fName.replace(DOT + FilenameUtils.getExtension(fName),
					SUBFIX + DOT + FilenameUtils.getExtension(fName));

		ImageIO.write(resizedImage, FilenameUtils.getExtension(fName),
				new File(Helper.getLocalPathByCategoryId(categoryId) + fName));
	}

	private ImageUtil() {
	}
}
