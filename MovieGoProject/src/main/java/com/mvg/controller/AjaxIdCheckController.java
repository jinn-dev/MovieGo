/*package com.mvg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvg.service.UserService;

public class AjaxIdCheckController {
	public static final String TRY_ID_CHECK = "tryIdCheck";
	@Autowired
	UserService service;
	
	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter(TRY_ID_CHECK);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			service.serviceCheckDuplicatedId(userId);
			out.print("'" + userId + "'는 사용할 수 있는 ID 입니다.");
		} catch (DuplicatedIdException | ServiceFailException e) {
			out.print("중복된 ID 입니다.");
		}
	}
}
*/