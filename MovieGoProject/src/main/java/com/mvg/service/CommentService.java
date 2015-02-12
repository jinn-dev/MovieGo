package com.mvg.service;

import com.mvg.entity.Comment;

public interface CommentService {
	
	int addComment(Comment comment);

	int updateComment(Comment comment);

	int deleteComment(int commentId);
	
	int getBoardIdByCmtId(int commentId);
}
