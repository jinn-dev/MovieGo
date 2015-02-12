package com.mvg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MyPageController {
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String myPage(){
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model) {
		return "mypage/modify";
	}
}
