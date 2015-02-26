package com.mvg.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvg.entity.Reservation;
import com.mvg.entity.ReservationInfo;
import com.mvg.entity.SeatInfo;
import com.mvg.entity.Theater;
import com.mvg.entity.User;
import com.mvg.service.MovieService;
import com.mvg.service.NowMovieService;
import com.mvg.service.ReservationInfoService;
import com.mvg.service.ReservationService;
import com.mvg.service.SeatInfoService;
import com.mvg.service.TheaterService;

@Controller
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

	@Autowired
	SeatInfoService sservice;

	@Autowired
	ReservationInfoService riservice;

	// 예매
	private int thId;
	private String thName;
	private String mCode;
	private String mName;
	private String mTime;
	private String mTimeampm;
	private int nmId;
	private String rinfo;
	private ArrayList<String> seats;
	private int peopleNum;

	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String reserveMovieCall(Model model) {
		List<Theater> theaters = tservice.getAllTheatersService();
		model.addAttribute("theaters", theaters);
		return "reservation/reservation1";
	}

	@RequestMapping(value = "/reserve/theater", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public @ResponseBody String theaterReceive(@RequestParam int theaterId,
			Model model) {

		thId = theaterId;
		logger.trace("수업: 극장아이디: " + thId);

		Map<String, String> codesAndNames = nservice
				.getAllNMovieNamesService(thId);
		Iterator<String> iter = codesAndNames.keySet().iterator();

		StringBuilder jsonBuilder = new StringBuilder();

		jsonBuilder.append("{\"movies\":[");
		if (iter.hasNext()) {
			String key = iter.next();
			String value = codesAndNames.get(key);
			jsonBuilder.append("{\"code\":").append(key).append(", ")
					.append("\"movieName\":").append("\"").append(value)
					.append("\"").append("}");
		}
		while (iter.hasNext()) {
			jsonBuilder.append(", ");
			String key = iter.next();
			String value = codesAndNames.get(key);
			jsonBuilder.append("{\"code\":").append(key).append(", ")
					.append("\"movieName\":").append("\"").append(value)
					.append("\"").append("}");
		}
		jsonBuilder.append("]}");

		logger.trace("수업: 영화: " + jsonBuilder.toString());

		return jsonBuilder.toString();

	}

	@RequestMapping(value = "reserve/movie", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public @ResponseBody String movieReceive(@RequestParam String movieCode,
			Model model) {

		mCode = movieCode;
		logger.trace("수업: 영화코드: " + mCode);

		Map<String, String> times = nservice.getNMovieTimeByThAndMovieService(
				thId, mCode);
		Iterator<String> iter = times.keySet().iterator();

		StringBuilder jsonBuilder = new StringBuilder();

		jsonBuilder.append("{\"times\":[");
		if (iter.hasNext()) {
			String key = iter.next();
			String value = times.get(key);
			jsonBuilder.append("{\"ampm\":").append(key).append(", ")
					.append("\"time\":").append("\"").append(value)
					.append("\"").append("}");
		}
		while (iter.hasNext()) {
			jsonBuilder.append(", ");
			String key = iter.next();
			String value = times.get(key);
			jsonBuilder.append("{\"ampm\":").append(key).append(", ")
					.append("\"time\":").append("\"").append(value)
					.append("\"").append("}");
		}
		jsonBuilder.append("]}");

		logger.trace("수업: 시간: " + jsonBuilder.toString());

		return jsonBuilder.toString();
	}

	@RequestMapping(value = "reserve/time", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public @ResponseBody String timeReceive(@RequestParam String time,
			Model model) {
		mTime = time;
		mTimeampm = nservice.getMTimeAmPmService(time);
		logger.trace("수업: 영화시간: " + mTime);
		thName = tservice.getTheaterByIdService(thId).getTheaterName();
		mName = mservice.getMovieByMCodeService(mCode).getMovieTitleKr();
		nmId = nservice.getNMovieIdByNMovieService(thId, mCode, mTime);
		rinfo = "영화관: " + thName + ", 영화: " + mName + ", 시간: " + mTimeampm;
		return rinfo;
	}

	@RequestMapping(value = "/reserve/seat", method = RequestMethod.GET)
	public String reserveSeat(Model model) {

		// nowmovie_id로 seatinfo조회
		List<SeatInfo> seats = sservice.getSInfoByNMovieIdService(nmId);

		// seatinfo에서 좌석아이디만뽑아서 seatIds 리스트에 저장
		ArrayList<Integer> seatIds = new ArrayList<Integer>();
		for (int i = 0; i < seats.size(); i++) {
			int id = seats.get(i).getSeatId();
			seatIds.add(i, id);
		}

		// 그중 예약되어 있는 좌석은 아이디만 따로 저장
		ArrayList<Integer> reservedSeats = new ArrayList<Integer>();
		for (int i = 0; i < seatIds.size(); i++) {
			ReservationInfo rinfo = riservice.getRInfoBySeatIdService(seatIds
					.get(i));
			if (rinfo != null) {
				reservedSeats.add(seatIds.get(i));
			}
		}

		logger.trace("수업: " + reservedSeats);
		Iterator<Integer> iter = reservedSeats.iterator();
		StringBuilder jsonBuilder = new StringBuilder();

		jsonBuilder.append("{\"rsvdSeats\":[");
		if (iter.hasNext()) {
			int value = iter.next();
			jsonBuilder.append("{\"seat\":").append(value).append("}");
		}
		while (iter.hasNext()) {
			jsonBuilder.append(", ");
			int value = iter.next();
			jsonBuilder.append("{\"seat\":").append(value).append("}");
		}
		jsonBuilder.append("]}");

		model.addAttribute("reservedSeats", jsonBuilder.toString());
		model.addAttribute("rinfo", rinfo);
		return "reservation/reserv";
	}

	@RequestMapping(value = "/reserve/payment", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String reservePayment(@RequestParam ArrayList<String> seatlist,
			@RequestParam int price, HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		// 만약 생일이 이번달이면 쿠폰을 yes로바꾸기
		Calendar birthday = Calendar.getInstance();
		birthday.setTime(user.getUserBirthday());
		// birmonth = 사용자의 생일인 달
		int birmonth = birthday.MONTH + 1;
		GregorianCalendar sys = new GregorianCalendar();
		// sysmonth = 이번달
		int sysmonth = sys.MONTH;
		// 생일쿠폰 가져오기
		if (birmonth == sysmonth) {
			user.setUserCoupon("y");
		}
		seats = seatlist;
		peopleNum = seats.size();
		model.addAttribute("price", price);
		model.addAttribute("seats", seats);
		model.addAttribute("rinfo", rinfo);
		model.addAttribute("peopleNum", peopleNum);
		return "reservation/payment";
	}

	@RequestMapping(value = "/reserve/complete", method = RequestMethod.POST)
	public String reserveComplete(@RequestParam int totalprice,
			@RequestParam int spoint, @RequestParam String yncoupon,
			@RequestParam int upoint, HttpSession session, Model model) {
		logger.trace("수업: 넘어온값: " + totalprice + ", " + spoint + ", "
				+ yncoupon + ", " + upoint);
		User user = (User) session.getAttribute("user");
		if (yncoupon.equals("used")) {
			user.setUserCoupon("n");
		}
		user.setUserPoint(user.getUserPoint() - upoint + spoint);
		Reservation r = new Reservation(user.getUserId(), peopleNum, totalprice);
		rservice.insertRService(r);
		int rid = r.getReservationId();
		for (int i = 0; i < seats.size(); i++) {
			int seatId = sservice.getSeatIdService(nmId, seats.get(i));
			ReservationInfo rsvinfo = new ReservationInfo();
			rsvinfo.setReservationId(rid);
			rsvinfo.setSeatId(seatId);
			riservice.insertRInfoService(rsvinfo);
		}
		String url = mservice.getMovieByMCodeService(mCode).getMovieImgUrl();
		model.addAttribute("rid", rid);
		model.addAttribute("price", totalprice);
		model.addAttribute("peopleNum", peopleNum);
		model.addAttribute("theater", thName);
		model.addAttribute("movie", mName);
		model.addAttribute("movieTime", mTimeampm);
		model.addAttribute("seats", seats);
		model.addAttribute("imgurl", url);
		return "reservation/reservation_complete";
	}

}
