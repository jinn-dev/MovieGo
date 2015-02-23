package com.mvg.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.Evaluation;
import com.mvg.entity.Movie;
import com.mvg.entity.Recommend;
import com.mvg.entity.User;
import com.mvg.entity.Wishlist;
import com.mvg.service.EvaluationService;
import com.mvg.service.MovieService;
import com.mvg.service.RecommendService;
import com.mvg.service.UserService;
import com.mvg.service.WishlistService;

@Controller
@SessionAttributes({ "wishlist", "evlist" })
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
	RecommendService rService;

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

	@RequestMapping(value = "/update", params = "_event_reverse", method = RequestMethod.POST)
	public String reinput(@ModelAttribute("user") User user) {
		return "mypage/modify";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/deleteuser", method = RequestMethod.GET)
	public String userDelete(@RequestParam String userId) {
		service.deleteUser(userId);
		return "redirect:/main";
	}

	// 위시리스트목록
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist(@RequestParam String userId, Model model) {
		List<Wishlist> wishlist = wService.getWishlistByUserId(userId);
		model.addAttribute("wishlist", wishlist);
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
	public String ratingList(@RequestParam String userId, Model model) {
		List<Evaluation> evaluation = eService.getEvaluationByUserId(userId);
		model.addAttribute("evlist", evaluation);
		return "mypage/rating_list";
	}

	// 영화평가 삭제
	@RequestMapping(value = "/deleteevaluation", method = RequestMethod.GET)
	public String evaluationDelete(@RequestParam int evId, HttpSession session) {
		eService.deleteEvaluation(evId);
		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		return "redirect:/ratinglist?userId=" + userId;
	}

	// 평가한영화 장르 통계
	@RequestMapping(value = "/genre.count", method = RequestMethod.POST)
	@ResponseBody
	public List<Recommend> ratingList(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Recommend> results = rService.countGenreService(user);
		return results;
	}
	
	// 장르기반 영화 추천
	@RequestMapping(value="/genre.rmd", method = RequestMethod.GET)
	public String rmdMovieBasedGenreRed (){
		return "mypage/recommend";
	}
	
	
	@RequestMapping(value="/genre.rmd.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Movie> rmdMovieBasedGenre(HttpSession session, @RequestParam int page){
		User user = (User) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user",user);
		map.put("page", page);
		List<Movie> results = rService.rmdMovieBasedGenreService(map);
		return results;
	}
}
