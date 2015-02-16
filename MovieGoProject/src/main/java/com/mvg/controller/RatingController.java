package com.mvg.controller;

import java.util.List;

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

import com.mvg.entity.Movie;
import com.mvg.entity.Wishlist;
import com.mvg.service.MovieService;
import com.mvg.service.WishlistService;

@Controller
@SessionAttributes("movies")
public class RatingController {
	@Autowired
	MovieService service;
	WishlistService wService;
	
	private static final Logger logger = LoggerFactory
			.getLogger(RatingController.class);

	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String rating(Model model) {
		List<Movie> movies = service.getAllMoviesService();
		model.addAttribute("movies", movies);
		return "rating/rating";
	}

	/*@RequestMapping(value="/test", method = RequestMethod.GET)
	public String ratingList(Model model){
		List<Movie> movies = service.randomGetAllMovies();
		model.addAttribute("movies", movies);
		return "rating/test";
		
	}
	
	@RequestMapping(value="/test", method = RequestMethod.GET,
			produces = "text/plain;charset=utf-8")
	public  String ajaxList(@RequestParam int page, Model model){
		int p = 0;
		p = page;
		List<Movie> movies = service.randomGetAllMovies();
		model.addAttribute("movies", movies);
		return "rating/test";
	}*/
	
	@RequestMapping(value = "/addwishlist", method = RequestMethod.GET)
	public String addWishlist(Model model, Wishlist wishlist) {
		int result = wService.insertWishlist(wishlist);
		return "rating/rating";
	}
}
