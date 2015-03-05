package com.mvg.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String commentWrite(@RequestParam String commentContent, @RequestParam int boardId, @RequestParam String userId) {
		Comment comment = new Comment();
		comment.setBoardId(boardId);
		comment.setCommentContent(commentContent);
		comment.setUserId(userId);
		service.addComment(comment);
		return "redirect:/comment/list?boardId="+boardId;
	}

	/* 댓글 삭제 */
	@RequestMapping(value = "/drop", method = RequestMethod.POST)
	public String commentDelete(@RequestParam int commentId) {
		int boardId = service.getBoardIdByCmtId(commentId);
		service.deleteComment(commentId);
		return "redirect:/comment/list?boardId=" + boardId;
	}

	/* 댓글 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public @ResponseBody Comment commentModify(@RequestParam int commentId) {
		Comment comment = service.getCommentByCmtId(commentId);
		return comment;
	}
	
	/* 댓글 수정 완료 */
	@RequestMapping(value = "/modified", method = RequestMethod.POST)
	public String commentModified(@RequestParam String commentContent, @RequestParam int commentId, @RequestParam int boardId) {
		Comment comment = service.getCommentByCmtId(commentId);
		comment.setCommentContent(commentContent);
		service.updateComment(comment);
		return "redirect:/comment/list?boardId="+boardId;
	}
	
	/* 댓글 목록 */
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public @ResponseBody List<Comment> commentList(@RequestParam int boardId){
		List<Comment> comments = service.getCommentByBoardId(boardId);
		return comments;
	}
}
