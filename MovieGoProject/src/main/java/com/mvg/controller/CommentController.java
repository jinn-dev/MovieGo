package com.mvg.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory
			.getLogger(CustomerBoardController.class);
	
public String commentWrite(@RequestParam int boardId, Model model){
		
		return "redirect:/view?";
	}
}
