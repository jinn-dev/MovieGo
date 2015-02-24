package com.mvg.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvg.entity.ReservationByUser;
import com.mvg.entity.User;
import com.mvg.service.ReservationByUserService;
import com.mvg.service.ReservationInfoService;
import com.mvg.service.ReservationService;

@Controller
public class MyRsvListController {
	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(MyRsvListController.class);
	}
	
	@Autowired
	ReservationService rservice;
	
	@Autowired
	ReservationInfoService riservice;
	
	@Autowired
	ReservationByUserService ruservice;
	
	@RequestMapping(value="/myrlist",  method=RequestMethod.GET)
	public String myRListCall(Model model, HttpSession session){
		//번호, 영화관, 영화제목, 예매일, 상영시간, 결제금액, 예매취소
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		
		List<ReservationByUser> rlist = ruservice.getAllRByUIdService(userId);
		
		StringBuilder jsonBuilder = new StringBuilder();
		jsonBuilder.append("{\"rlist\":[");
		for (int i=0;i<rlist.size();i++) {
			ReservationByUser ru = rlist.get(i);
			int rnum = i+1;
			if (i==rlist.size()-1) {
				jsonBuilder.append("{\"theater\":")
				.append("\"")
				.append(ru.getTheaterName())
				.append("\"")
				.append(", ")
				.append("\"movie\":")
				.append("\"")
				.append(ru.getMovieName())
				.append("\"")
				.append(", ")
				.append("\"rdate\":")
				.append("\"")
				.append(ru.getReservationDate())
				.append("\"")
				.append(", ")
				.append("\"mtime\":")
				.append("\"")
				.append(ru.getMovieTime())
				.append("\"")
				.append(", ")
				.append("\"price\":")
				.append("\"")
				.append(ru.getReservationPrice())
				.append("\"")
				.append("}");		
			}
			jsonBuilder.append(", ")
			.append("{\"theater\":")
			.append("\"")
			.append(ru.getTheaterName())
			.append("\"")
			.append(", ")
			.append("\"movie\":")
			.append("\"")
			.append(ru.getMovieName())
			.append("\"")
			.append(", ")
			.append("\"rdate\":")
			.append("\"")
			.append(ru.getReservationDate())
			.append("\"")
			.append(", ")
			.append("\"mtime\":")
			.append("\"")
			.append(ru.getMovieTime())
			.append("\"")
			.append(", ")
			.append("\"price\":")
			.append("\"")
			.append(ru.getReservationPrice())
			.append("\"")
			.append("}");
			
		}
		jsonBuilder.append("]}");
		logger.trace("수업: 시간: "+jsonBuilder.toString());
		return "mypage/reservation_list";
	}

}
