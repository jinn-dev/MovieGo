package com.mvg.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hamcrest.core.Every;
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
import com.mvg.entity.User;
import com.mvg.entity.Wishlist;
import com.mvg.service.EvaluationService;
import com.mvg.service.MovieService;
import com.mvg.service.UserService;
import com.mvg.service.WishlistService;

@Controller
@SessionAttributes({"evRating", "movies", "onemovie", "evcheck", "movieinfo", "evlist", "avgRating"})
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
	
	@RequestMapping(value = "/rating.do", method = RequestMethod.GET)
	public String ratingTest2() {
		return "rating/test";
	}
	
	@RequestMapping(value = "/rating.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<Movie> ratingTest(@RequestParam int page) {
		List<Movie> movies = service.randomGetAllMovies(page);
		return movies;
	}

	@RequestMapping(value = "/addwishlist", method = RequestMethod.GET)
	@ResponseBody
	public int addWishlist(@RequestParam String movieCode, Model model, HttpSession session) {

		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		
		int result = wService.getWishlistCntByUM(movieCode, userId);
		
		if(result == 0) {
			Wishlist wishlist = new Wishlist();
			wishlist.setMovieCode(movieCode);
			wishlist.setUserId(userId);
			
			wService.insertWishlist(wishlist);
		}
		
		else {
			logger.trace("위시리스트 이미 추가되어있음" );
		}
		return result;
	}
	
	@RequestMapping(value = "/evcomment", method = RequestMethod.GET)
	public String evComment(Model model) {
		return "rating/write_comment";
	}

	@RequestMapping(value = "/addevcomment", params = "_event_confirmed", method = RequestMethod.POST)
	public String addEvComment(Model model, @ModelAttribute("ecomment") Evaluation ecomment) {
		eService.updateEvaluation(ecomment);
		return "rating/write_comment";
	}

	
	@RequestMapping(value = "/evcommentchk", method = RequestMethod.GET)
	@ResponseBody
	public int evcommentchk(Model model, @RequestParam String movieCode, HttpSession session) {
		User user = (User) session.getAttribute("log");	
		String userId = user.getUserId();
		int test = eService.selectEvaluationByMovieCode(movieCode, userId);
		return test;
	}
	
	@RequestMapping(value = "/evrating", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String evRating(@RequestParam String code, Model model, HttpSession session) {

		String sRating = code.substring(0, 1);
		int rating = Integer.parseInt(sRating);
		String movieCode = code.substring(1, 9);
		
		User user = (User) session.getAttribute("log");
		String userId = user.getUserId();
		
		int test = eService.selectEvaluationByMovieCode(movieCode, userId);
		Evaluation evaluation = null;
		if(test == 0) {
			evaluation = new Evaluation(userId, movieCode, rating);
			eService.insertEvaluation(evaluation);
		}
		else {
			int evId = eService.selectEvId(movieCode, userId);

			evaluation = new Evaluation(evId, userId, movieCode, rating);
			eService.updateRating(evaluation);
		}
		
		Movie movie = service.getMovieByMCodeService(movieCode);
		model.addAttribute("onemovie", movie);
		model.addAttribute("evRating", evaluation);
		return "rating/rating";
	}
	
	@RequestMapping(value = "/movieinfo", method = RequestMethod.GET)
	public String movieInfo(@RequestParam String movieCode, Model model) {
		Movie movie = service.getMovieByMCodeService(movieCode);
		model.addAttribute("movieinfo", movie);
		List<Evaluation> evaluation = eService.getEvaluationByMovieCode(movieCode);
		model.addAttribute("evlist", evaluation);
		int addRating = 0;
		for(int i = 0; i < evaluation.size(); i++) {
			addRating += evaluation.get(i).getEvRating();
		}
		double avgRating = (double)addRating / evaluation.size();
		model.addAttribute("avgRating", avgRating);
		return "rating/movie_info";
	}

	
}
