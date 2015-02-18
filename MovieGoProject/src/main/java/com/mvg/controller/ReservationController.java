package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.NowMovie;
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
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, "times",
				new CustomDateEditor(simpleDateFormat, true));
	}
	
	
	
	private int thId;
	private String mCode;
	private String mTime;
	
	
	@RequestMapping(value="/reserve",  method=RequestMethod.GET)
	public String reserveMovieCall(Model model){
		List<Theater> theaters = tservice.getAllTheatersService();
		model.addAttribute("theaters", theaters);
		
		List<NowMovie> nowmovies = nservice.getAllNMoviesService();
		logger.trace("수업: "+nowmovies);
		
		return "reservation/reservation1";
	}
	
	@RequestMapping(value="/reserve/theater", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String theaterReceive(@RequestParam int theaterId, Model model) {
		
		thId = theaterId;
		
		Map<String, String> codesAndNames = nservice.getAllNMovieNamesService(thId);
		Iterator<String> iter = codesAndNames.keySet().iterator();
		
		StringBuilder jsonBuilder = new StringBuilder();
		
		jsonBuilder.append("{\"movies\":[");
		if(iter.hasNext()) {
			String key = iter.next();
			String value = codesAndNames.get(key);
			jsonBuilder.append("{\"code\":")
				.append(key)
				.append(", ")
				.append("\"movieName\":")
				.append("\"")
				.append(value)
				.append("\"")
				.append("}");
		}
		while(iter.hasNext()) {
			jsonBuilder.append(", ");
			String key = iter.next();
			String value = codesAndNames.get(key);
			jsonBuilder.append("{\"code\":")
				.append(key)
				.append(", ")
				.append("\"movieName\":")
				.append("\"")
				.append(value)
				.append("\"")
				.append("}");
		}
		jsonBuilder.append("]}");
		
		logger.trace("수업: ㅇㅇ"+jsonBuilder.toString());
		
		return jsonBuilder.toString();

	}
	
	@RequestMapping(value="reserve/movie", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String movieReceive(@RequestParam String movieCode, Model model) {
		
		mCode = movieCode;
		
		Map<String, String> times = nservice.getNowMovieByThAndMovieService(thId, mCode);
		Iterator<String> iter = times.keySet().iterator();
		
		StringBuilder jsonBuilder = new StringBuilder();
		
		jsonBuilder.append("{\"times\":[");
		if(iter.hasNext()) {
			String key = iter.next();
			String value = times.get(key);
			jsonBuilder.append("{\"ampm\":")
				.append(key)
				.append(", ")
				.append("\"time\":")
				.append("\"")
				.append(value)
				.append("\"")
				.append("}");
		}
		while(iter.hasNext()) {
			jsonBuilder.append(", ");
			String key = iter.next();
			String value = times.get(key);
			jsonBuilder.append("{\"ampm\":")
				.append(key)
				.append(", ")
				.append("\"time\":")
				.append("\"")
				.append(value)
				.append("\"")
				.append("}");
		}
		jsonBuilder.append("]}");
		
		logger.trace("수업: ㅇㅇ"+jsonBuilder.toString());
		
		return jsonBuilder.toString();

	}
	
	@RequestMapping(value="reserve/time", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String timeReceive(@RequestParam String time, Model model) {
		mTime = time;
		logger.trace("수업: 영화시간: "+time);

		return "";
	}
	

	@RequestMapping(value="/reserve/seat", method=RequestMethod.GET)
	public String reserveSeat() {
		return "reservation/reservation2";
	}
	
	
}
