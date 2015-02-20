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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.Evaluation;
import com.mvg.entity.Movie;
import com.mvg.entity.Wishlist;
import com.mvg.service.EvaluationService;
import com.mvg.service.MovieService;
import com.mvg.service.UserService;
import com.mvg.service.WishlistService;

@Controller
@SessionAttributes({ "evRating", "movies" })
public class RatingController {
	@Autowired
	MovieService service;
	@Autowired
	WishlistService wService;
	@Autowired
	EvaluationService eService;
	@Autowired
	UserService uService;

	private static final Logger logger = LoggerFactory
			.getLogger(RatingController.class);

	@RequestMapping(value="/thumbnail", method = RequestMethod.GET)
	@ResponseBody
	public String showThumbnail (@RequestParam String movieCode){
		String thumbnail = service.getMovieThumbnailService(movieCode);
		return thumbnail;
	}
	
	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String rating(Model model) {
		List<Movie> movies = service.getAllMoviesService();
		model.addAttribute("movies", movies);
		return "rating/rating";
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

	@RequestMapping(value = "/addcomment", method = RequestMethod.POST)
	public String addComment(
			@ModelAttribute("addComment") Evaluation addComment, Model model) {
		logger.trace("수업:" + addComment.getEvId());
		eService.updateEvaluation(addComment);
		return "rating/rating";
	}

	@RequestMapping(value = "/evrating", method = RequestMethod.GET)
	public String evRating(Model model) {

		return "rating/write_comment";
	}

	@RequestMapping(value = "/evrating", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String evRating(@RequestParam String code, Model model) {
		logger.trace("수업: " + code);
		String sRating = code.substring(0, 1);
		int evRating = Integer.parseInt(sRating);
		String movieCode = code.substring(1, 9);
		logger.trace("수업: " + movieCode + evRating);
		Evaluation evaluation = new Evaluation("a", movieCode, evRating);
		eService.insertEvaluation(evaluation);
		model.addAttribute("evRating", evaluation);
		return "rating/rating";
	}
}
