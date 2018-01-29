package com.tuean.service;

import java.io.InputStream;

import com.tuean.common.Category;
import com.tuean.model.File;

public interface FileService {
	String saveTempFile(InputStream is, String extension);

	String saveTempFile(java.io.File f, String extension);

	java.io.File getTempFile(String fName);

	File saveTempFile(String tempFName, Category category);

	java.io.File getFile(String fCode);

	boolean deleteFile(Integer fId);

	File saveFile(java.io.File f, String extension, Category category);

	File getFileInfo(Integer fId);

	File getFileInfoByFileCode(String fCode);

	String getTempPath();

}
