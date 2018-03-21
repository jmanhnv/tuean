package com.tuean.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringJoiner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.tuean.common.Actions;
import com.tuean.service.FileService;
import com.tuean.util.ConstUtil;
import com.tuean.util.ListFilesUtil;

@Controller
public class UploadController implements Actions, ConstUtil {
	@Autowired
	private FileService fileService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String displayUploadForm() {
		return UPLOADFILE;
	}

	@RequestMapping(value = "/savefiles", method = RequestMethod.POST)
	public String saveFiles(@RequestParam("category") String category, @RequestParam("files") MultipartFile[] files,
			Model map) throws IllegalStateException, IOException {
		Integer categoryId = Integer.valueOf(category);
		StringJoiner sj = new StringJoiner(",");
		List<String> fileNames = Lists.newArrayList();

		// save file to local & db
		fileService.saveFileUploaded(files, categoryId);

		for (MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if (!Strings.isNullOrEmpty(fileName)) {
				// Handle file content - multipartFile.getInputStream()
				file.transferTo(new File(ListFilesUtil.getLocalPathByCategoryId(categoryId) + fileName));
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
