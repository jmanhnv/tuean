package com.tuean.util;

public interface ConstUtil {
	String DEFAULT_DATE_FORMAT = "dd/MM/yyyy";
	String DEFAULT_DATETIME_FORMAT = "dd/MM/yyyy HH:mm";
	String ZERO = "0";
	String AMPERSAND = "&";
	String AT = "@";
	String BACK_SLASH = "\\";
	String BLANK = "";
	String SPACE = " ";
	String COLON = ":";
	String COMMA = ",";
	String COMMA_AND_SPACE = ", ";
	String DASH = "-";
	String DOLLAR = "$";
	String PERCENT = "%";
	String DOT = ".";
	String PIPE = "|";
	String PLUS = "+";
	String MINUS = "-";
	String POUND = "#";
	String QUESTION = "?";
	String QUOTE = "\"";
	String RETURN = "\r";
	String RETURN_NEW_LINE = "\r\n";
	String SEMICOLON = ";";
	String SLASH = "/";
	String STAR = "*";
	String TILDE = "~";
	String UTF8 = "UTF-8";

	//
	String FILE_SEPARATOR = System.getProperty("file.separator");
	String USER_HOME = System.getProperty("user.home");
	String TMP_DIR = System.getProperty("java.io.tmpdir");

	// Save the uploaded file to this folder
	String UPLOADED_FOLDER = USER_HOME + FILE_SEPARATOR + "images"; // {/home/cokf3ea1/images/}

}
