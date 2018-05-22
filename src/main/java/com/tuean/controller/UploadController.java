package com.tuean.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {
		String css;
		String msgContent;
		if (files == null || files.length == 0 || files[0].isEmpty()) {
			css = "danger";
			msgContent = "Please select a file to upload.";
		} else {
			Integer categoryId = Integer.valueOf(category);
			// save file to local & db
			List<String> uploads = fileService.saveFileUploaded(files, categoryId);
			css = "success";
			msgContent = String.format("%d file(s) uploaded successfully.", uploads.size());
		}

		redirectAttributes.addFlashAttribute("css", css);
		redirectAttributes.addFlashAttribute("msgContent", msgContent);

		return "redirect:/upload";
	}

}
