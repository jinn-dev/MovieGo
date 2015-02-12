package com.mvg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.CommentDao;
import com.mvg.entity.Comment;

@Service
public class CommentServiceImpl implements CommentService {

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
		return result;
	}

	@Override
	public int getBoardIdByCmtId(int commentId) {
		int result = dao.getBoardByCmtId(commentId);
		return result;
	}

}
