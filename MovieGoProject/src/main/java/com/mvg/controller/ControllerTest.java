package com.mvg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControllerTest {

	@RequestMapping(value="/main",  method=RequestMethod.GET)
	public String mainTest(){
		return "/main";
	}
	
	@RequestMapping(value="/idConfirm",  method=RequestMethod.GET)
	public String idConfirmTest(){
		return "/find_user_info";
	}
	
}
