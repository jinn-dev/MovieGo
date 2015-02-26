package com.mvg.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvg.entity.Theater;
import com.mvg.service.TheaterService;

@Controller
public class TheaterController {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(TheaterController.class);
	}

	@Autowired
	TheaterService service;

	@RequestMapping(value = "/theater", method = RequestMethod.GET)
	public String testMethod(Model model) {
		List<Theater> theaters = service.getAllTheatersService();
		model.addAttribute("allTheaters", theaters);
		return "reservation/reservation1";
	}

}
