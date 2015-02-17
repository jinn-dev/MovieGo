package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvg.entity.Movie;
import com.mvg.entity.User;
import com.mvg.entity.Wishlist;
import com.mvg.service.MovieService;
import com.mvg.service.UserService;
import com.mvg.service.WishlistService;
@Controller
@SessionAttributes("wishlist")
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
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String myPage(){
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/wishlist", method=RequestMethod.GET)
	public String wishlist(@RequestParam String userId, Model model){
		List<Wishlist> wishlist = wService.getWishlistByUserId(userId);
/*		logger.trace("수업:" + wishlist.getMovies());
*/		model.addAttribute("wishlist", wishlist);
		return "mypage/wishlist";
	}
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model, User user, HttpSession session) {
		model.addAttribute("user", session.getAttribute("user"));
		return "mypage/modify";
	}
	
/*	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("user")User user) {
	    service.updateUser(user);
		return "mypage/mypage";
	}
	*/
	
	@RequestMapping(value="/update", params="_event_confirmed", method=RequestMethod.POST)
	public String update(@ModelAttribute("user") User user) {
	    service.updateUser(user);
		return "mypage/mypage";
	}
	@RequestMapping(value="/update",  params="_event_reverse", method=RequestMethod.POST)
	public String reinput(@ModelAttribute("user") User user) {
		return "mypage/modify";
	}
	@RequestMapping(value="/mypage/del", method=RequestMethod.GET)
	public String boardDelete(@RequestParam String userId){
		service.deleteUser(userId);
		return "redirect:/main";
	}
}
