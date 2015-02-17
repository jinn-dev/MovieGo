package com.mvg.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.Theater;
import com.mvg.service.MovieService;
import com.mvg.service.NowMovieService;
import com.mvg.service.ReservationService;
import com.mvg.service.TheaterService;

@Controller
@SessionAttributes("rsv, rsvInfo")
public class ReservationController {
	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ControllerTest.class);
	}

	@Autowired
	ReservationService rservice;
	
	@Autowired
	TheaterService tservice;
	
	@Autowired
	NowMovieService nservice;
	
	@Autowired
	MovieService mservice;
	
	@RequestMapping(value="/reserve/movie",  method=RequestMethod.GET)
	public String reserveMovie(Model model){
		List<Theater> theaters = tservice.getAllTheatersService();
		model.addAttribute("theaters", theaters);
		Map<String, String> codesAndNames = nservice.getAllNMovieNamesService();
		model.addAttribute("nowmovies", codesAndNames);
		return "reservation/reservation1";
	}
	
	@RequestMapping(value="/reserve/seat", method=RequestMethod.GET)
	public String reserveSeat() {
		return "reservation/reservation2";
	}
	
	
}
