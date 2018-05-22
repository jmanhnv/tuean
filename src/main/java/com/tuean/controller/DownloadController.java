package com.tuean.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tuean.common.Actions;
import com.tuean.util.ConstUtil;

@Controller
public class DownloadController implements Actions, ConstUtil {
	/*
	 * Download a file from - inside project, located in resources folder. - outside project, located in File system
	 * somewhere.
	 */
	@RequestMapping(value = "/download-{fpath}", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, @PathVariable("fpath") String fpath) throws IOException {
		File file = new File(fpath);

		if (!file.exists()) {
			String errorMessage = "Sorry. The file you are looking for does not exist";
			System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName(UTF8)));
			outputStream.close();
			return;
		}

		String mimeType = URLConnection.guessContentTypeFromName(file.getName());
		if (mimeType == null) {
			System.out.println("mimetype is not detectable, will take default");
			mimeType = "application/octet-stream";
		}

		System.out.println("mimetype : " + mimeType);

		response.setContentType(mimeType);

		/*
		 * "Content-Disposition : inline" will show viewable types [like images/text/pdf/anything viewable by browser]
		 * right on browser while others(zip e.g) will be directly downloaded [may provide save as popup, based on your
		 * browser setting.]
		 */
		response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

		/*
		 * "Content-Disposition : attachment" will be directly download, may provide save as popup, based on your
		 * browser setting
		 */
		// response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));
		//// response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

		response.setContentLength((int) file.length());

		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

		// Copy bytes from source to destination(outputstream in this example), closes both streams.
		FileCopyUtils.copy(inputStream, response.getOutputStream());
	}
}
