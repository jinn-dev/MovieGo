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

}
