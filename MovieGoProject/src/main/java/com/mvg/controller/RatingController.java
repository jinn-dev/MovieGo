package com.mvg.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@Autowired
	WishlistService wService;
	
	private static final Logger logger = LoggerFactory
			.getLogger(RatingController.class);

	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String rating(Model model) {
		List<Movie> movies = service.getAllMoviesService();
		model.addAttribute("movies", movies);
		return "rating/rating";
	}
	
	/*@RequestMapping(value = "/addwishlist", method = RequestMethod.GET)
	public String addWishlist(Model model, @RequestParam String userId, String movieCode) {
	logger.trace("수업;" + userId + movieCode);
		Wishlist wishlist = new Wishlist(userId, movieCode);
		logger.trace("수업:" + wishlist);
		wService.insertWishlist(wishlist);

		return "redirect:/rating/rating";
	}*/

	@RequestMapping(value = "/addwishlist", params="_event_confirmed", method = RequestMethod.POST)
		public String addWishlist(Model model, @ModelAttribute("wishlists") Wishlist wishlists) {
		wService.insertWishlist(wishlists);
		return "rating/rating";
	}


	
	/*@RequestMapping(value="/submit", params="_event_confirmed", method=RequestMethod.POST)
	public String boardSubmit(@ModelAttribute("board") CustomerBoard board){
		service.addBoard(board);
		return "redirect:/board";
	}*/
}
