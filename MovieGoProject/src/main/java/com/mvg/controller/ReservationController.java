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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String reserveMovieCall(Model model){
		List<Theater> theaters = tservice.getAllTheatersService();
		model.addAttribute("theaters", theaters);
		return "reservation/reservation1";
	}
	
	@RequestMapping(value="reserve/movie", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String theaterReceive(Model model, @RequestParam int theaterId) {
		logger.trace("수업: 극장아이디: "+theaterId);
		Map<String, String> codesAndNames = nservice.getAllNMovieNamesService(theaterId);
		model.addAttribute("nowmovies", codesAndNames);
		return codesAndNames.toString();
	}
	
	@RequestMapping(value="/reserve/seat", method=RequestMethod.POST)
	public String reserveSeat() {
		return "reservation/reservation2";
	}
	
	
}
