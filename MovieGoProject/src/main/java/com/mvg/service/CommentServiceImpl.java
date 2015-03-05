package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.CommentDao;
import com.mvg.entity.Comment;

@Service
public class CommentServiceImpl implements CommentService {

	private static final Logger logger = LoggerFactory
			.getLogger(CommentServiceImpl.class);
	
	@Autowired
	CommentDao dao;
	
	@Override
	public int addComment(Comment comment) {
		int result = dao.insertComment(comment);
		return result;
	}

	@Override
	public int updateComment(Comment comment) {
		int result = dao.updateComment(comment);
		return result;
	}

	@Override
	public int deleteComment(int commentId) {
		int result = dao.deleteComment(commentId);
		logger.trace("코멘트삭제"+result);
		return result;
	}

	@Override
	public int getBoardIdByCmtId(int commentId) {
		int result = dao.getBoardByCmtId(commentId);
		return result;
	}

	@Override
	public List<Comment> getCommentByBoardId(int boardId) {
		List<Comment> results = dao.getCommentByBoardId(boardId);
		return results;
	}

	@Override
	public Comment getCommentByCmtId(int commentId) {
		Comment result = dao.getCommentByCommentId(commentId);
		return result;
	}

}
