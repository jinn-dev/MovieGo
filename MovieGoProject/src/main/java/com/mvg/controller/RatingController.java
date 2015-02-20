package com.mvg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.Movie;
import com.mvg.entity.Wishlist;
import com.mvg.service.EvaluationService;
import com.mvg.service.MovieService;
import com.mvg.service.WishlistService;

@Controller
@SessionAttributes("movies")
public class RatingController {
	@Autowired
	MovieService service;
	@Autowired
	WishlistService wService;
	@Autowired
	EvaluationService eService;

	private static final Logger logger = LoggerFactory
			.getLogger(RatingController.class);

	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String rating(Model model) {
		List<Movie> movies = service.getAllMoviesService();
		model.addAttribute("movies", movies);
		return "rating/rating";
	}
	
	@RequestMapping(value = "/rating.test", method = RequestMethod.GET)
	public String ratingTest(Model model) {
		// List<Movie> movies = service.randomGetAllMovies();
		// model.addAttribute("movies", movies);
		return "rating/test";
	}
	
	@RequestMapping(value = "/ajax", method = RequestMethod.GET,
			produces = "text/plain;charset=utf-8")
	@ResponseBody
	public List<Movie> ratingTest2(){
		List<Movie> movies = service.randomGetAllMovies();
		return movies;
	}

	@RequestMapping(value = "/addwishlist", params = "_event_confirmed", method = RequestMethod.POST)
	public String addWishlist(Model model,
			@ModelAttribute("wishlists") Wishlist wishlists) {
		wService.insertWishlist(wishlists);
		return "rating/rating";
	}

	@RequestMapping(value = "/evcomment", method = RequestMethod.GET)
	public String evComment(Model model) {
		return "rating/write_comment";
	}

	@RequestMapping(value = "/evrating", method = RequestMethod.GET)
	public String evRating(Model model) {

		return "rating/write_comment";
	}
}
