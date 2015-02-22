package com.mvg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.bind.support.SessionStatus;

import com.mvg.entity.User;
import com.mvg.service.UserService;

@Controller
@SessionAttributes({ "log", "user" })
public class ControllerTest {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ControllerTest.class);
	}

	@Autowired
	UserService service;

	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, "userBirthday",
				new CustomDateEditor(simpleDateFormat, true));
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainTest(Model model) {
		model.addAttribute("log", new User());
		return "main";
	}

	@RequestMapping(value = "/find_user_info", method = RequestMethod.GET)
	public String idConfirmTest() {
		return "user/find_user_info";
	}


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	@ResponseBody
	public User loginCheck(Model model, @RequestParam String userId, @RequestParam String userPwd) {
		User log = new User();
		log.setUserId(userId);
		log.setUserPwd(userPwd);
		
		User u = service.getUserByUserId(log);
		if(u != null) {
			model.addAttribute("log", u);
			model.addAttribute("user", u);
		}
		
		else {
			logger.trace("사용자없음");
		}
		
		return u;
	}
	

	@RequestMapping(value = "/mainlogined", method = RequestMethod.GET)
	public String mainlogined() {
		return "user/main_logined";
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String goMain() {
		return "user/main_logined";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(@ModelAttribute("log") User log,
			SessionStatus sessionStatus) {
		if(log!=null){
			sessionStatus.setComplete();
		}
		return "redirect:/main";
	}

	@RequestMapping(value = "/signup", params = "_event_confirmed", method = RequestMethod.POST)
	public String mainLogined(User user, Model model) {
		service.insertUser(user);
		return "main";
	}

	@RequestMapping(value = "/duplicate", method = RequestMethod.GET)
	@ResponseBody
	public String duplicate(@RequestParam String userId) {
		  String result = service.selectUserById(userId);
			return result;
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	@ResponseBody
	public String idcheck(@RequestParam String userEmail) {
		  String result = service.selectUserByEmail(userEmail);
		  logger.trace("수업:" + result);
			return result;
	}
	
	@RequestMapping(value = "/passwordCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@RequestParam String userId, @RequestParam String userEmail) {
		  String result = service.selectUserByIdAndEmail(userId, userEmail);
			return result;
	}
	
	@RequestMapping(value="/apitest3")
	public String apiTest3(){
		return "apitest/restService3";
	}
}
	/*
	  ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		int result = service.selectUserById(userId);
		mav.addObject("result", result);
		logger.trace("controller에서" + result);
		return mav;
	}
	 @RequestMapping(value = "/test/SessionCheck")
	@ResponseBody
	public void selectDetail3(HttpSession session,
			@ModelAttribute("SessionVO") SessionVO sessionVO,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {

		// 이부분에 세션 체크 넣어주면됨.
		sessionVO sessionVO = CommonUtil.getSessionVOInfo("user");

		String check = null;
		if (sessionVO != null) {
			check = "ok";
		}

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (check != null) {
			out.print(check);
		} else {
			// 실패 메시지
			out.print("");
		}

	}*/
