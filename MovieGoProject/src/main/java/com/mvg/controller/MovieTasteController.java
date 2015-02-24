package com.mvg.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvg.entity.Movie;
import com.mvg.entity.User;
import com.mvg.service.RecommendService;

@Controller
public class MovieTasteController {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(MyPageController.class);
	}

	@Autowired
	RecommendService service;

	// 선호장르 통계
	@RequestMapping(value = "/genre.count", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> ratingList(HttpSession session) {
		User user = (User) session.getAttribute("user");
		int result = service.countMovieEvalService(user);
		List<Movie> results = service.countGenreService(user);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("results", results);
		logger.trace("결과" + results);
		return map;
	}

	// 선호국가 통계
	@RequestMapping(value = "/nation.count", method = RequestMethod.GET)
	public String tasteNationRedirect() {
		return "mypage/favorite_nations";
	}
	@RequestMapping(value = "/nation.count.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Movie> tasteNation(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Movie> results = service.countNationService(user);
		logger.trace("결과" + results);
		return results;
	}

	// 장르기반 영화 추천
	@RequestMapping(value = "/genre.rmd", method = RequestMethod.GET)
	public String rmdMovieBasedGenreRedirect() {
		return "mypage/recommend";
	}

	@RequestMapping(value = "/genre.rmd.do", method = RequestMethod.GET)
	@ResponseBody
	public List<Movie> rmdMovieBasedGenre(HttpSession session,
			@RequestParam int page) {
		User user = (User) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", user.getUserId());
		map.put("page", page);
		List<Movie> results = service.rmdMovieBasedGenreService(map);
		return results;
	}

}
