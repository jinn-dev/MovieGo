package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mvg.entity.User;
import com.mvg.service.UserService;

@Controller
@SessionAttributes("log")
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
	public String mainTest(Model model) {
		model.addAttribute("log", new User());
		return "main";
	}

	@RequestMapping(value = "/find_user_info", method = RequestMethod.GET)
	public String idConfirmTest() {
		return "user/find_user_info";
	}

	@RequestMapping(value="/login",  method=RequestMethod.POST)
	public String login(Model model, @ModelAttribute("log") User log, HttpSession session){
		User user = service.getUserByUserId(log);
		logger.trace("수업:" + session.getAttribute("log"));
		model.addAttribute("log", user);
		return "user/main_logined";
	}
	
	@RequestMapping(value="/logout",  method=RequestMethod.GET)
	public String logout(@ModelAttribute("log") User log, SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return "redirect:/main";
	}
	
	@RequestMapping(value="/main_logined", method=RequestMethod.POST)
	public String mainLogined(User user, Model model){
	    service.insertUser(user);
	    return "main";
	}

	@RequestMapping(value = "/board_view", method = RequestMethod.GET)
	public String boardview() {
		return "board/board_view";
	}

}
