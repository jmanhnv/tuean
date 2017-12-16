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
		File uploadDirectory = new File(System.getProperty("java.io.tmpdir"));

		// register a MultipartConfigElement
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
