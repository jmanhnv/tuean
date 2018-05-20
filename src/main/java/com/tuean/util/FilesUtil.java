package com.tuean.util;

import java.io.File;
import java.util.List;

import com.google.common.collect.Lists;

/**
 * Contains some methods to list files and folders from a directory.
 * 
 * @author Johny
 */
public class FilesUtil implements ConstUtil {
	/**
	 * List all the files and folders from a directory
	 * 
	 * @param dirName
	 *            current directory to be listed
	 */
	public static List<File> listFilesAndFoldersInDirectory(final String dirName) {
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
	public static List<File> listFilesOnlyInDirectory(final String dirName) {
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
	public static List<File> listFoldersOnlyInDirectory(final String dirName) {
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
	public static List<File> listFilesInDirectoryAndSubDirectories(final String dirName) {
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
