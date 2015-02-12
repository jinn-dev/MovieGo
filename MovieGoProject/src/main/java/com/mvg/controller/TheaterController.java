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
	
	//int cnt = service.getTheaterCntService();
	//List<Theater> theaters = service.getAllTheatersService();
	
	
	@RequestMapping(value="/reservation1", method=RequestMethod.GET)
	public String reservation(Model model) {
		/*model.addAttribute("theaterCnt", cnt);
		model.addAttribute("allTheaters", theaters);
		logger.trace("수업: "+cnt+"(개수) , "+theaters+" (영화)");*/
		return "reservation1";
	}
	
}
