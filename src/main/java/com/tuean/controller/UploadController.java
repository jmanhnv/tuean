package com.tuean.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringJoiner;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.tuean.common.Actions;
import com.tuean.util.ConstUtil;

@Controller
public class UploadController implements Actions, ConstUtil {
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String displayUploadForm() {
		return UPLOADFILE;
	}

	@RequestMapping(value = "/savefiles", method = RequestMethod.POST)
	public String saveFiles(@RequestParam("files") MultipartFile[] files, Model map)
			throws IllegalStateException, IOException {
		StringJoiner sj = new StringJoiner(",");
		List<String> fileNames = Lists.newArrayList();

		for (MultipartFile file : files) {
			if (file.isEmpty()) continue;

			String fileName = file.getOriginalFilename();
			if (!"".equalsIgnoreCase(fileName)) {
				// Handle file content - multipartFile.getInputStream()
				file.transferTo(new File(UPLOADED_FOLDER + fileName));
				fileNames.add(fileName);

				sj.add(fileName);
			}
		}

		String msg;
		String uploadedFileName = sj.toString();
		if (Strings.isNullOrEmpty(uploadedFileName)) {
			msg = "Please select a file to upload.";
		} else {
			msg = "You successfully uploaded '" + uploadedFileName + "'";
		}

		map.addAttribute("message", msg);
		map.addAttribute("files", fileNames);

		return UPLOADFILE_SUCCESS;
	}
}
