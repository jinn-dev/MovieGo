package com.mvg.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	/* 댓글 쓰기 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String commentWrite(Comment comment) {
		service.addComment(comment);
		String path = "redirect:/board/view?boardId=" + comment.getBoardId();
		return path;
	}

	/* 댓글 삭제 */
	@RequestMapping(value = "/drop", method = RequestMethod.GET)
	public String commentDelete(@RequestParam int commentId) {
		int boardId = service.getBoardIdByCmtId(commentId);
		logger.trace("글번호" + boardId);
		logger.trace("코멘트번호" + commentId);
		service.deleteComment(commentId);
		String path = "redirect:/board/view?boardId=" + boardId;
		return path;
	}

	/* 댓글 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String commentModify(@ModelAttribute("comment") Comment comment) {
		service.updateComment(comment);
		String path = "redirect:/board/view?boardId=" + comment.getBoardId();
		return path;
	}
}
