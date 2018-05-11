package com.tuean.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringJoiner;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.tuean.common.Actions;
import com.tuean.service.FileService;
import com.tuean.util.ConstUtil;
import com.tuean.util.FilesUtil;

@Controller
public class UploadController implements Actions, ConstUtil {
	@Autowired
	private FileService fileService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String displayUploadForm() {
		return UPLOADFILE;
	}

	@RequestMapping(value = "/savefiles", method = RequestMethod.POST)
	public String saveFiles(@RequestParam("category") String category, @RequestParam("files") MultipartFile[] files,
			Model map) throws IllegalStateException, IOException {
		Integer categoryId = Integer.valueOf(category);
		StringJoiner sj = new StringJoiner(",");
		List<String> fileNames = Lists.newArrayList();

		// save file to local & db
		fileService.saveFileUploaded(files, categoryId);

		for (MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if (!Strings.isNullOrEmpty(fileName)) {
				// Handle file content - multipartFile.getInputStream()
				// file.transferTo(new File(FilesUtil.getLocalPathByCategoryId(categoryId) + fileName));

				// dimension for normal size (default)
				resizeImage(file, categoryId, FilesUtil.WIDTH, FilesUtil.HEIGHT);

				// dimension for view detail size
				resizeImage(file, categoryId, FilesUtil.WIDTH_2X, FilesUtil.HEIGHT_2X);

				fileNames.add(fileName);

				sj.add(fileName);
			}
		}

		String msg;
		String uploadedFileName = sj.toString();
		if (Strings.isNullOrEmpty(uploadedFileName)) {
			msg = "Please select a file to upload.";
		} else {
			msg = "You successfully uploaded '" + uploadedFileName + "'";
		}

		map.addAttribute("message", msg);
		map.addAttribute("files", fileNames);

		return UPLOADFILE_SUCCESS;
	}

	private void resizeImage(final MultipartFile file, int categoryId, final int width, final int height)
			throws IOException {
		BufferedImage originalImage = ImageIO.read(file.getInputStream());
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

		BufferedImage resizedImage = new BufferedImage(width, height, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, width, height, null);
		g.dispose();

		String fName = file.getOriginalFilename();
		if (FilesUtil.WIDTH_2X == width && FilesUtil.HEIGHT_2X == height)
			fName = fName.replace(DOT + FilenameUtils.getExtension(fName),
					FilesUtil.SUBFIX + DOT + FilenameUtils.getExtension(fName));

		ImageIO.write(resizedImage, FilenameUtils.getExtension(fName),
				new File(FilesUtil.getLocalPathByCategoryId(categoryId) + fName));
	}

}
