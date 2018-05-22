package com.tuean.configuration;

import java.io.File;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.tuean.util.ConstUtil;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer implements ConstUtil {
	private static final int MAX_FILESIZE_UPLOAD = 10 * 1024 * 1024; // 10 MB

	/* Set these variables for your project needs */
	private static final String LOCATION = TMP_DIR;
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 25;// 25MB
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 30;// 30MB
	private static final int FILE_SIZE_THRESHOLD = 0;

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected void customizeRegistration(Dynamic registration) {
		// upload temp file will put here
		File uploadDirectory = new File(LOCATION);

		// register a MultipartConfigElement
		// MultipartConfigElement multipartConfigElement = new MultipartConfigElement(LOCATION, MAX_FILE_SIZE,
		// MAX_REQUEST_SIZE, FILE_SIZE_THRESHOLD);
		MultipartConfigElement multipartConfigElement = new MultipartConfigElement(uploadDirectory.getAbsolutePath(),
				MAX_FILESIZE_UPLOAD, MAX_FILESIZE_UPLOAD * 2, MAX_FILESIZE_UPLOAD / 2);

		registration.setMultipartConfig(multipartConfigElement);
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding(UTF8);
		return new Filter[] { characterEncodingFilter, new HiddenHttpMethodFilter() };
	}

}
