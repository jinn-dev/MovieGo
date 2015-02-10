package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Comment;

public interface CommentDao {

	//모든 댓글의 수 가져오기
	int getAllCommentCount();
	
	//댓글 모두 가져오기
	List<Comment> getAllComments();
	
	//댓글 등록
	int insertComment(Comment comment);
	
	//댓글 수정
	int updateComment(Comment comment);
	
	//댓글 삭제
	int deleteComment(int commentId);
	
	//댓글 가져오기
	Comment getCommentByCommentId(int commentId);
	
}
