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
import org.springframework.web.bind.annotation.RequestParam;

import com.mvg.entity.Cancellation;
import com.mvg.entity.CancellationByUser;
import com.mvg.entity.ReservationByUser;
import com.mvg.entity.ReservationInfo;
import com.mvg.entity.User;
import com.mvg.service.CancellationByUserService;
import com.mvg.service.CancellationService;
import com.mvg.service.MovieService;
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

	@Autowired
	CancellationService cservice;

	@Autowired
	CancellationByUserService cuservice;
	
	@Autowired
	MovieService mservice;

	@RequestMapping(value = "/myrlist", method = RequestMethod.GET)
	public String myRListCall(Model model, HttpSession session) {
		// 번호, 영화관, 영화제목, 예매일, 상영시간, 결제금액, 예매취소
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		List<ReservationByUser> rlist = ruservice.getAllRByUIdService(userId);
		for (int i = 0; i < rlist.size(); i++) {
			ReservationByUser ru = rlist.get(i);
			int cancel = ruservice.cancelYNService(ru.getMovieTime());
			if (cancel >= 0) {
				ru.setCancel("y");
			} else {
				ru.setCancel("n");
			}
			rlist.set(i, ru);
		}
		logger.trace("수업: " + rlist);
		model.addAttribute("rlist", rlist);
		return "mypage/reservation_list";
	}

	@RequestMapping(value = "/cancelConfirm", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String cancelConfirm(@RequestParam int rid, Model model,
			HttpSession session) {
		Cancellation c = new Cancellation();
		User user = (User) session.getAttribute("user");
		List<ReservationInfo> info = riservice.getRInfoByRIdService(rid);
		for (int i = 0; i < info.size(); i++) {
			c.setUserId(user.getUserId());
			c.setSeatId(info.get(i).getSeatId());
			cservice.insertCancelService(c);
		}
		rservice.deleteRService(rid);
		return "mypage/cancel_confirm";
	}

	@RequestMapping(value = "/myclist", method = RequestMethod.GET)
	public String myCListCall(Model model, HttpSession session) {
		// 취소번호, 영화관, 영화제목, 상영시간, 취소일
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		List<CancellationByUser> clist = cuservice.getCListByUIdService(userId);

		logger.trace("수업: " + clist);

		model.addAttribute("clist", clist);

		return "mypage/cancel_list";
	}

}
