package com.tuean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.base.Strings;
import com.tuean.common.Actions;
import com.tuean.dto.UserDto;
import com.tuean.formbean.LoginForm;
import com.tuean.service.UserService;
import com.tuean.util.ConstUtil;

@Controller
public class LoginController implements Actions, ConstUtil {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute LoginForm loginBean) {
		if (loginBean != null && !Strings.isNullOrEmpty(loginBean.getEmail())
				&& !Strings.isNullOrEmpty(loginBean.getPassword())) {
			try {
				UserDto user = userService.loadUserByEmailPwd(loginBean.getEmail().toLowerCase().trim(),
						loginBean.getPassword());
				model.addAttribute("msg", user.getName());
				return DASHBOARD;
			} catch (Exception e) {
				model.addAttribute("error", "Invalid username and password.");
				return LOGIN_PAGE;
			}
		} else {
			model.addAttribute("error", "Please enter your login details.");
			return LOGIN_PAGE;
		}
	}
}
