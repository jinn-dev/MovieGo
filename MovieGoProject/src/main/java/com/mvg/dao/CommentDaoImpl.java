package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {
	private static final Logger logger = LoggerFactory
			.getLogger(CommentDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace ="com.mvg.mappers.commentMapper.";
	
	
	@Override
	public int getAllCommentCount() {
		String stmt = namespace+"selectBoardCnt";
		return sqlSession.selectOne(stmt);
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
		String stmt = namespace+"updateComment";
		int result = sqlSession.update(stmt, comment);
		return result;
	}

	@Override
	public int deleteComment(int commentId) {
		String stmt = namespace+"deleteComment";
		int result = sqlSession.delete(stmt, commentId);
		logger.trace("코멘트삭제"+result);
		return result;
	}

	@Override
	public Comment getCommentByCommentId(int commentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBoardByCmtId(int commentId) {
		String stmt = namespace+"selectBoardIdByCommentId";
		int result = sqlSession.selectOne(stmt, commentId);
		return result;
	}

	@Override
	public List<Comment> getCommentByBoardId(int boardId) {
		String stmt = namespace+"selectCommentByBoardId";
		List<Comment> results = sqlSession.selectList(stmt, boardId);
		return results;
	}

}
