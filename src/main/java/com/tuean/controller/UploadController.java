package com.tuean.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tuean.common.Actions;
import com.tuean.service.FileService;
import com.tuean.util.ConstUtil;

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
		String msg;
		if (files == null || files.length == 0) {
			msg = "Please select a file to upload.";
		}

		Integer categoryId = Integer.valueOf(category);

		// save file to local & db
		List<String> uploads = fileService.saveFileUploaded(files, categoryId);
		msg = "You successfully uploaded '" + uploads + "'";

		map.addAttribute("message", msg);
		map.addAttribute("files", uploads);

		return UPLOADFILE_SUCCESS;
	}

}
