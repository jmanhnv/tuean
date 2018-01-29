package com.tuean.common;

import java.io.File;
import java.io.IOException;

import com.tuean.util.ConstUtil;

public class App implements ConstUtil {

	public static void main(String[] args) {
		// Character that separates components of a file path. This is "/" on UNIX and
		// "\" on Windows.
		System.out.println(System.getProperty("file.separator"));// "\"

		// Path separator character used in java.class.path
		System.out.println(System.getProperty("path.separator"));// ";"

		// Sequence used by operating system to separate lines in text files
		System.out.println(System.getProperty("line.separator"));

		// User home directory
		System.out.println(System.getProperty("user.home"));// C:\Users\Johny

		// User working directory
		System.out.println(System.getProperty("user.dir"));// D:\Source_refers\tuean

		// Get the temporary directory
		System.out.println(System.getProperty("java.io.tmpdir"));// C:\Users\Johny\AppData\Local\Temp\

		System.out.println(UPLOADED_FOLDER);

		// GetTempFilePath
		getTempFilePath();
	}

	private static void getTempFilePath() {
		try {
			// create a temp file
			File temp = File.createTempFile("temp-file-name", ".tmp");
			System.out.println("Temp file: " + temp.getAbsolutePath());

			// Get temporary file path
			String absolutePath = temp.getAbsolutePath();
			String tempFilePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

			System.out.println("Temp file path: " + tempFilePath);

		} catch (IOException e) {

			e.printStackTrace();

		}
	}
}
