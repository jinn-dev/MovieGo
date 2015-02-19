package com.mvg.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;
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
	
	
	private int thId;
	private String mCode;
	private String mTime;
	
	
	@RequestMapping(value="/reserve",  method=RequestMethod.GET)
	public String reserveMovieCall(Model model){
		List<Theater> theaters = tservice.getAllTheatersService();
		model.addAttribute("theaters", theaters);
		return "reservation/reservation1";
	}
	
	@RequestMapping(value="/reserve/theater", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String theaterReceive(@RequestParam int theaterId, Model model) {
		
		thId = theaterId;
		logger.trace("수업: 극장아이디: "+thId);
		
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
		
		String json = JSONValue.toJSONString(codesAndNames);
		logger.trace("수업: "+json);
		return jsonBuilder.toString();

	}
	
	@RequestMapping(value="reserve/movie", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String movieReceive(@RequestParam String movieCode, Model model) {

		
		mCode = movieCode;
		logger.trace("수업: 영화코드: "+mCode);
		
		Map<String, String> times = nservice.getNMovieTimeByThAndMovieService(thId, mCode);
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
		logger.trace("수업: 영화시간: "+mTime);

		return "tndus";
	}

	@RequestMapping(value="/reserve/seat", method=RequestMethod.GET)
	public String reserveSeat() {
		return "reservation/reservation2";
	}
	
	
}
