package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.CustomerBoard;

@Repository
public class CustomerBoardDaoImpl implements CustomerBoardDao {

	private static final Logger logger = LoggerFactory
			.getLogger(CustomerBoardDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace="com.mvg.mappers.customerBoardMapper.";
	
	@Override
	public int getAllBoardCount() {
		String stmt = namespace+"selectBoardCnt";
		return sqlSession.selectOne(stmt);
	}

	@Override
	public List<CustomerBoard> getAllBoard() {
		String stmt = namespace+"selectAllBoard";
		List<CustomerBoard> results = sqlSession.selectList(stmt);
		return results;
	}

	@Override
	public int insertCustomerBoard(CustomerBoard board) {
		String stmt = namespace+"insertBoard";
		int result = sqlSession.insert(stmt, board);
		return result;
	}

	@Override
	public int updateCustomerBoard(CustomerBoard board) {
		String stmt = namespace+"updateBoard";
		int result = sqlSession.update(stmt, board);
		return result;
	}

	@Override
	public void deleteCustomerBoard(int boardId) {
		String stmt = namespace+"deleteComment";
		sqlSession.delete(stmt, boardId);
		String stmt2 = namespace+"deleteBoard";
		sqlSession.delete(stmt2, boardId);
	}

	@Override
	public CustomerBoard getBoardByBoardId(int boardId) {
		String stmt = namespace+"selectBoardByNo";
		CustomerBoard result = sqlSession.selectOne(stmt, boardId);
		return result;
	}

	@Override
	public CustomerBoard getBoardByBoardIdWithComments(int boardId) {
		String stmt = namespace+"selectBoardByIdWithCmt";
		CustomerBoard results = sqlSession.selectOne(stmt, boardId);
		return results;
	}

	@Override
	public List<CustomerBoard> getBoardByUserId(String userId) {
		String stmt = namespace+"selectBoardByUserId";
		List<CustomerBoard> results = sqlSession.selectList(stmt, userId);
		return results;
	}


}
