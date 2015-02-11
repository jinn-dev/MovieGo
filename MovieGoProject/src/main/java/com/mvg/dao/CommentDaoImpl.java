package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvg.entity.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace ="com.mvg.mappers.commentMapper.";
	
	
	@Override
	public int getAllCommentCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Comment> getAllComments() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComment(Comment comment) {
		String stmt = namespace+"insertComment";
		int result = sqlSession.insert(stmt, comment);
		return result;
	}

	@Override
	public int updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int commentId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Comment getCommentByCommentId(int commentId) {
		// TODO Auto-generated method stub
		return null;
	}

}
