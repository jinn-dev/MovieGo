package com.mvg.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvg.entity.Comment;
import com.mvg.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	private static final Logger logger = LoggerFactory
			.getLogger(CustomerBoardController.class);

	@Autowired
	CommentService service;
	
	/* 댓글 쓰기 */
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String commentWrite(Comment comment) {
		service.addComment(comment);
		String path ="redirect:/board/view?boardId="+comment.getBoardId();
		return path;
	}
	
	/* 댓글 삭제 */
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String commentDelete(@RequestParam int commentId){
		int boardId = service.getBoardIdByCmtId(commentId);
		service.deleteComment(commentId);
		String path = "redirect:/board/view?boardId="+boardId;
		return path;
	}

/*	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody String commentList(@RequestParam int boardId, Model model, HttpServletResponse response){
		List<Comment> lists = service.getCommentByBoardId(boardId);
		 Gson gson = new Gson();
		String json = new Gson().toJson(lists);
	
		return  json;
	}*/
}
