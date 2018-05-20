package com.tuean.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.tuean.common.Category;
import com.tuean.common.Helper;
import com.tuean.dao.FileDao;
import com.tuean.util.ConstUtil;
import com.tuean.util.DateCfg;
import com.tuean.util.ImageUtil;
import com.tuean.util.LogUtil;

@Service("fileService")
public class FileServiceImpl implements FileService, ConstUtil {
	private static final Logger logger = LogUtil.getLogger(FileServiceImpl.class);

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

	@Autowired
	private FileDao fileDao;

	private String getTempFilePath(String fName) {
		return new StringBuilder().append(getLocalTempPath()).append(fName).toString();
	}

	private static String getLocalTempPath() {
		return TMP_DIR;
	}

	private static String getLocalFilePath(String fName) {
		return new StringBuilder().append(UPLOADED_FOLDER).append(FILE_SEPARATOR).append(fName).toString();
	}

	private java.io.File getPhysicsFile(com.tuean.model.File f) {
		String key = f.getPath() + FILE_SEPARATOR + f.getCode();
		String path = getLocalFilePath(key);
		File file = new File(path);
		if (file.exists() && file.isFile())
			return file;
		return null;
	}

	@Override
	public String saveTempFile(InputStream is, String extension) {
		Validate.notBlank(extension);

		// create a new file name
		String uuid = UUID.randomUUID().toString();
		String fileName = uuid + DOT + extension;
		String tmpFilePath = getTempFilePath(fileName);

		// save temp file
		try {
			File file = new File(tmpFilePath);
			FileUtils.copyInputStreamToFile(is, file);

			return fileName;
		} catch (IOException e) {
			logger.error("Create temp file error", e);
			return null;
		}
	}

	@Override
	public String saveTempFile(File f, String extension) {
		Validate.notBlank(extension);

		// create a new file name
		String uuid = UUID.randomUUID().toString();
		String fileName = uuid + DOT + extension;
		String tmpFilePath = getTempFilePath(fileName);

		// save temp file
		try {
			FileUtils.copyFile(f, new File(tmpFilePath));
			return uuid;
		} catch (IOException e) {
			logger.error("Create temp file error", e);
			return null;
		}
	}

	@Override
	public File getTempFile(String fName) {
		String tempFilePath = getTempFilePath(fName);
		return new File(tempFilePath);
	}

	@Override
	public com.tuean.model.File saveTempFile(String tempFName, Category category) {
		// get temp file
		File srcFile = getTempFile(tempFName);
		if (srcFile == null || !srcFile.isFile() || !srcFile.exists()) {
			logger.error("File not found");
			return null;
		}

		// save file
		return saveFile(srcFile, FilenameUtils.getExtension(tempFName), category);
	}

	@Override
	public File getFile(String fCode) {
		// find file record
		com.tuean.model.File f = fileDao.getFileByCode(fCode);
		if (f != null)
			// get physics file
			return getPhysicsFile(f);

		// file record not found
		return null;
	}

	@Override
	public boolean deleteFile(Integer fId) {
		// find file record
		com.tuean.model.File f = fileDao.getFileById(fId);
		if (f == null)
			// file record not found
			return true;

		// get file key
		String fileKey = f.getPath() + FILE_SEPARATOR + f.getCode();
		// delete database
		fileDao.delete(fId);

		// Delete original file
		String localFilePath = getLocalFilePath(fileKey);
		File file = new File(localFilePath);
		if (file.isFile() && file.exists())
			file.delete();

		return true;
	}

	@Override
	public com.tuean.model.File getFileInfo(Integer fId) {
		return fileDao.getFileById(fId);
	}

	@Override
	public com.tuean.model.File getFileInfoByFileCode(String fCode) {
		return fileDao.getFileByCode(fCode);
	}

	@Override
	public String getTempPath() {
		return getLocalTempPath();
	}

	public com.tuean.model.File saveFile(File file, String extension, Category category) {
		String uuid = UUID.randomUUID().toString();

		com.tuean.model.Category cat = new com.tuean.model.Category();
		cat.setId(category.getKey());
		cat.setName(category.toString());
		cat.setDescription(category.toString());

		final Date now = DateCfg.getSysDate();
		com.tuean.model.File f = new com.tuean.model.File();
		f.setCode(uuid);
		f.setName(file.getName());
		f.setOriginal_name(file.getName());
		f.setPath(getLocalFilePath(file.getName()));
		f.setExtension(extension);
		f.setCategory(cat);
		f.setCreatedDate(now);
		f.setUpdatedDate(now);

		f = fileDao.save(f);
		return f;
	}

	@Override
	public List<String> saveFileUploaded(MultipartFile[] files, Integer categoryId) throws IOException {
		List<String> fileNames = Lists.newArrayList();

		// Get category
		Category category = Helper.getCategoryById(categoryId);

		// Loop file
		for (MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if (!Strings.isNullOrEmpty(fileName)) {
				// Handle file content - multipartFile.getInputStream()
				// file.transferTo(new File(FilesUtil.getLocalPathByCategoryId(categoryId) + fileName));

				// 1. Copy file to local
				// dimension for normal size (default)
				ImageUtil.resizeImage(file, categoryId, ImageUtil.WIDTH, ImageUtil.HEIGHT);

				// dimension for view detail size
				ImageUtil.resizeImage(file, categoryId, ImageUtil.WIDTH_2X, ImageUtil.HEIGHT_2X);

				// 2. Save current file into database
				final String extension = fileName.substring(fileName.lastIndexOf(DOT));
				File f = new File(Helper.getLocalPathByCategoryId(categoryId) + fileName);
				saveFile(f, extension, category);

				fileNames.add(fileName);
			}
		}

		return fileNames;
	}

}
