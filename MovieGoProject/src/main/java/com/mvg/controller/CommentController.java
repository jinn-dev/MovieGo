package com.mvg.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvg.entity.Comment;
import com.mvg.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	private static final Logger logger = LoggerFactory
			.getLogger(CustomerBoardController.class);

	@Autowired
	CommentService service;

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String commentWrite(Comment comment) {
		service.addComment(comment);
		String Path ="redirect:/board/view?boardId="+comment.getBoardId();
		return Path;
	}
}
