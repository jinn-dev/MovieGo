package com.mvg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvg.service.UserService;

@Controller
public class ControllerTest {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value="/main",  method=RequestMethod.GET)
	public String mainTest(){
		return "main";
	}
	

	@RequestMapping(value="/test", method=RequestMethod.GET) 
	public String testMethod(Model model) {
		int result = service.getUserCntService();
		model.addAttribute("cnt", result);
		return "test";
	}

	@RequestMapping(value="/userInfo",  method=RequestMethod.GET)
	public String idConfirmTest(){
		return "find_user_info";
	}
	

}
