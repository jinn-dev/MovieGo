package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvg.entity.User;
import com.mvg.service.UserService;

@Controller
public class ControllerTest {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ControllerTest.class);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, "userBirthday",
				new CustomDateEditor(simpleDateFormat, true));
	}

	@Autowired
	UserService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainTest() {
		return "main";
	}

	@RequestMapping(value = "/find_user_info", method = RequestMethod.GET)
	public String idConfirmTest() {
		return "user/find_user_info";
	}

	@RequestMapping(value = "/main_logined", method = RequestMethod.POST)
	public String mainLogined(User user) {

		service.insertUser(user);
		logger.trace("수업 " + user);
		return "user/main_logined";
	}

	@RequestMapping(value = "/board_view", method = RequestMethod.GET)
	public String boardview() {
		return "board/board_view";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String testMethod(Model model) {
		int result = service.getUserCntService();
		model.addAttribute("cnt", result);
		return "test";
	}

	// api이용한 페이지로 가게하는 requestMapping
	@RequestMapping(value = "/api", method = RequestMethod.GET)
	public String InsertMovie(Model model) {
		return "restService";
	}

}
