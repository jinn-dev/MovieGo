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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CustomerBoard> getAllBoard() {
		String stmt = namespace+"selectAllBoard";
		List<CustomerBoard> results = sqlSession.selectList(stmt);
		return results;
	}

	@Override
	public List<CustomerBoard> getAllBoardWithComments() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCustomerBoard(CustomerBoard board) {
		String stmt= namespace+"insertBoard";
		int result = sqlSession.insert(stmt, board);
		return result;
	}

	@Override
	public int updateCustomerBoard(CustomerBoard board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCustomerBoard(int boardId) {
		// TODO Auto-generated method stub
		return 0;
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
		logger.trace("결과값!!"+results);
		return results;
	}

	@Override
	public List<CustomerBoard> getBoardByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomerBoard> getBoardByUserIdWithComments(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
