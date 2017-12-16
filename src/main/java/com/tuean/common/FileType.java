package com.tuean.common;

/**
 * Defined File Extensions and MIME Types that allows in system.
 * 
 * @author jnguyen
 */
public enum FileType {
	JPEG("jpeg", "image/jpeg"), JPE("jpe", "image/jpeg"), JPG("jpg", "image/jpeg"), PNG("png", "image/png"), GIF("gif",
			"image/gif"), ICO("ico", "image/x-icon"), SVG("svg", "image/svg+xml"), PDF("pdf", "application/pdf"), JSON(
					"json", "application/json"), XML("xml", "application/xml"), DXF("dxf", "image/vnd.dxf"), // AutoCAD
																												// DXF
	ZIP("zip", "application/zip");

	// File Extension
	private String extension;

	// MIME Type / Internet Media Type
	private String mimeType;

	private FileType(final String ext, final String mtype) {
		this.extension = ext;
		this.mimeType = mtype;
	}

	public String getExtension() {
		return extension;
	}

	public String getMimeType() {
		return mimeType;
	}

}
