package com.mvg.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.mvg.service.ReservationService;

@Controller
public class ReservationController {
	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ControllerTest.class);
	}

	@Autowired
	ReservationService service;
	
	@RequestMapping(value="/reservation",  method=RequestMethod.GET)
	public String reservationTest(){
		return "reservation/reservation1";
	}
}
