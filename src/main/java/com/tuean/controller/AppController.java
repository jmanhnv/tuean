package com.tuean.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuean.common.Actions;
import com.tuean.common.Helper;
import com.tuean.formbean.LoginForm;
import com.tuean.util.ConstUtil;
import com.tuean.util.FilesUtil;

@Controller
@RequestMapping("/")
public class AppController implements Actions, ConstUtil {
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);

	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value = { "/", "/dashboard" }, method = RequestMethod.GET)
	public String dashboard(ModelMap model) {
		return DASHBOARD;
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(@RequestParam("categoryId") int categoryId, ModelMap model) {
		List<File> files = FilesUtil.listFilesOnlyInDirectory(FilesUtil.getLocalPathByCategoryId(categoryId));
		if (CollectionUtils.isEmpty(files)) model.addAttribute("message", "File not found!");

		List<String> fileNames = files.stream()
				.map(f -> ALIAS_FILE_PATH + SLASH + Helper.getCategoryNameById(categoryId) + SLASH + f.getName())
				.collect(Collectors.toList());
		model.addAttribute("files", fileNames);
		return PRODUCT;
	}

	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public String introduce(ModelMap model) {
		return INTRODUCE;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		return REGISTER;
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(ModelMap model) {
		return CONTACT;
	}

	////////// LOGIN-IN/OUT ACTION //////////
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public String loginPage(@ModelAttribute("loginBean") LoginForm loginBean) {
		// model.addAttribute("loginBean", new LoginForm());
		return LOGIN_PAGE;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpServletResponse resp, ModelMap model,
			@ModelAttribute("loginBean") LoginForm loginBean) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) new SecurityContextLogoutHandler().logout(req, resp, auth);

		model.addAttribute("msg", messageSource.getMessage("logout.msg", new Object[] { "Johny Nguyen" },
				LocaleContextHolder.getLocale()));
		// return "redirect:/loginpage?logout";
		return LOGIN_PAGE;
	}
	////////// END //////////

	////////// MULTI-LANGUAGES //////////
	@RequestMapping(value = "/locale", method = RequestMethod.GET)
	public String switchLocale(Locale locale, Model model) {

		// add parameter message from controller
		String welcome = messageSource.getMessage("welcome.message", new Object[] { "Johny Nguyen" }, locale);
		model.addAttribute("message", welcome);

		// obtain locale from LocaleContextHolder
		Locale currentLocale = LocaleContextHolder.getLocale();
		model.addAttribute("locale", currentLocale);

		model.addAttribute("startMeeting", "10:30");

		logger.error(welcome);

		return DASHBOARD;
	}
	////////// END //////////

	// ////////// SECURITY CHECK //////////
	// @RequestMapping(value = "/admin", method = RequestMethod.GET)
	// public String adminPage(ModelMap model) {
	// model.addAttribute("user", getPrincipal());
	// return "admin";
	// }
	//
	// @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	// public String accessDeniedPage(ModelMap model) {
	// model.addAttribute("user", getPrincipal());
	// return ACCESS_DENIED;
	// }
	//
	// private String getPrincipal() {
	// String userName = null;
	// Object principal =
	// SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	//
	// if (principal instanceof UserDetails) {
	// userName = ((UserDetails) principal).getUsername();
	// } else {
	// userName = principal.toString();
	// }
	//
	// return userName;
	// }
	// ////////// END //////////

}
