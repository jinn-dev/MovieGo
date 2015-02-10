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
	
	@RequestMapping(value="/find_user_info",  method=RequestMethod.GET)
	public String idConfirmTest(){
		return "user/find_user_info";
	}
	
	@RequestMapping(value="/main_logined", method=RequestMethod.GET)
	public String mainLogined(){
		return "user/main_logined";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET) 
	public String testMethod(Model model) {
		int result = service.getUserCntService();
		model.addAttribute("cnt", result);
		return "test";
	}

	//api이용한 페이지로 가게하는 requestMapping
	@RequestMapping(value="/api", method=RequestMethod.GET)
	public String InsertMovie(Model model) {
		return "restService";
	}
	
	//jsp 에서 openapi사용해보기

}
