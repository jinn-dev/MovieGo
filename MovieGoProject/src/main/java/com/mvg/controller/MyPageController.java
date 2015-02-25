package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.Evaluation;
import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;
import com.mvg.entity.User;
import com.mvg.entity.Wishlist;
import com.mvg.service.EvaluationService;
import com.mvg.service.MovieService;
import com.mvg.service.NowMovieService;
import com.mvg.service.RecommendService;
import com.mvg.service.UserService;
import com.mvg.service.WishlistService;

@Controller
@SessionAttributes({ "wishlist", "evlist"})
public class MyPageController {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(MyPageController.class);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, "userBirthday",
				new CustomDateEditor(simpleDateFormat, true));
	}

	@Autowired
	UserService service;
	@Autowired
	WishlistService wService;
	@Autowired
	MovieService mService;
	@Autowired
	EvaluationService eService;
	@Autowired
	NowMovieService nService;

	// 마이페이지 첫화면
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "mypage/mypage";
	}

	// 회원정보 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model, User user, HttpSession session) {
		model.addAttribute("user", session.getAttribute("user"));
		return "mypage/modify";
	}

	@RequestMapping(value = "/update", params = "_event_confirmed", method = RequestMethod.POST)
	public String update(@ModelAttribute("user") User user) {
		service.updateUser(user);
		return "mypage/mypage";
	}

/*	@RequestMapping(value = "/update", params = "_event_reverse", method = RequestMethod.POST)
	public String reinput(@ModelAttribute("user") User user) {
		return "mypage/modify";
	}
*/
	// 회원 탈퇴
	@RequestMapping(value = "/deleteuser", method = RequestMethod.GET)
	public String userDelete(@RequestParam String userId) {
		service.deleteUser(userId);
		return "redirect:/main";
	}

	// 위시리스트jsp 가져오기
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist(Model model) {
		
		return "mypage/wishlist";
	}

	// 위시리스트에서 삭제
	@RequestMapping(value = "/deletewishlist", method = RequestMethod.GET)
	public String wishlistDelete(@RequestParam int wishId, HttpSession session) {
		wService.deleteWishlist(wishId);
		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		return "redirect:/wishlist?userId=" + userId;
	}

	// 영화평가목록 보기
	@RequestMapping(value = "/ratinglist", method = RequestMethod.GET)
	public String ratingList() {
		return "mypage/rating_list";
	}

	// 위시리스트 보기
	// 위시리스트 가져오는 에이젝스
	@RequestMapping(value = "/wishlist.ajax", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> wishlistAjax(HttpSession session) {
		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		List<Wishlist> wishlist = wService.getWishlistByUserId(userId);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("wishlist", wishlist);
		List<NowMovie> now = nService.getAllDistictNowMovieCodes();

		map.put("nowlist", now);
		return map;
	}

	// 평가리스트 가져오는 에이젝스
	@RequestMapping(value = "/ratinglist.ajax", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> ratinglistAjax(HttpSession session) {
		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		List<Evaluation> evaluation = eService.getEvaluationByUserId(userId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("evaluation", evaluation);
		List<NowMovie> now = nService.getAllDistictNowMovieCodes();

		map.put("nowlist", now);
		return map;
	}

	// 영화평가 삭제
	@RequestMapping(value = "/deleteevaluation", method = RequestMethod.GET)
	public String evaluationDelete(@RequestParam int evId, HttpSession session) {
		eService.deleteEvaluation(evId);
		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		return "redirect:/ratinglist?userId=" + userId;
	}
}
