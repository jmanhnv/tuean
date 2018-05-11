package com.tuean.util;

import java.io.File;
import java.util.List;

import com.google.common.collect.Lists;
import com.tuean.service.FileServiceImpl;

/**
 * Contains some methods to list files and folders from a directory.
 * 
 * @author Johny
 */
public class FilesUtil implements ConstUtil {
	public static final int WIDTH = 720;
	public static final int HEIGHT = 480;
	public static final int WIDTH_2X = 1440;
	public static final int HEIGHT_2X = 960;
	public static final String SUBFIX = "@2x";

	/**
	 * Get file path base on categoryId
	 * 
	 * @param categoryId
	 * @return file path
	 */
	public static String getLocalPathByCategoryId(int categoryId) {
		String path;
		if (categoryId == 1) path = FileServiceImpl.BC_FOLDER;
		else if (categoryId == 2) path = FileServiceImpl.CT_FOLDER;
		else if (categoryId == 3) path = FileServiceImpl.MK_FOLDER;
		else if (categoryId == 4) path = FileServiceImpl.CC_FOLDER;
		else path = FileServiceImpl.HR_FOLDER;

		return path + FILE_SEPARATOR;
	}

	/**
	 * List all the files and folders from a directory
	 * 
	 * @param dirName
	 *            current directory to be listed
	 */
	public static List<File> listFilesAndFoldersInDirectory(String dirName) {
		List<File> files = Lists.newArrayList();
		File directory = new File(dirName);
		// get all the files and folder from a directory
		File[] fList = directory.listFiles();
		for (File file : fList) {
			// System.out.println(file.getName());
			files.add(file);
		}
		return files;
	}

	/**
	 * List all the files under a directory
	 * 
	 * @param dirName
	 *            current directory to be listed
	 */
	public static List<File> listFilesOnlyInDirectory(String dirName) {
		List<File> files = Lists.newArrayList();
		File directory = new File(dirName);
		// get all the files from a directory
		File[] fList = directory.listFiles();
		for (File file : fList) {
			if (file.isFile()) { // check has a file
				// System.out.println(file.getName());
				files.add(file);
			}
		}
		return files;
	}

	/**
	 * List all the folder under a directory
	 * 
	 * @param dirName
	 *            current directory to be listed
	 */
	public static List<File> listFoldersOnlyInDirectory(String dirName) {
		List<File> files = Lists.newArrayList();
		File directory = new File(dirName);
		// get all the files from a directory
		File[] fList = directory.listFiles();
		for (File file : fList) {
			if (file.isDirectory()) { // check has a directory
				// System.out.println(file.getName());
				files.add(file);
			}
		}
		return files;
	}

	/**
	 * List all files from a directory and its in sub-directories
	 * 
	 * @param dirName
	 *            current directory to be listed
	 */
	public static List<File> listFilesInDirectoryAndSubDirectories(String dirName) {
		List<File> files = Lists.newArrayList();
		File directory = new File(dirName);
		// get all the files from a directory
		File[] fList = directory.listFiles();
		for (File file : fList) {
			if (file.isFile()) { // check has a file
				// System.out.println(file.getAbsolutePath());
				// System.out.println(file.getName());
				files.add(file);
			} else if (file.isDirectory()) { // check has a directory then recursive loop file again
				listFilesInDirectoryAndSubDirectories(file.getAbsolutePath());
			}
		}
		return files;
	}

	public static void main(String[] args) {
		// Windows directory example
		final String currentDirName = "C:\\Users\\Johny\\images";
		listFilesOnlyInDirectory(currentDirName);
		listFoldersOnlyInDirectory(currentDirName);
		listFilesAndFoldersInDirectory(currentDirName);
		listFilesInDirectoryAndSubDirectories(currentDirName);
	}

}
