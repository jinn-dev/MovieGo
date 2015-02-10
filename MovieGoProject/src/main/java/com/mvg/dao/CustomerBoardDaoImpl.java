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
	
	String nameSpace="com.mvg.mappers.customerBoardMapper.";
	
	@Override
	public int getAllBoardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CustomerBoard> getAllBoard() {
		String stmt = nameSpace+"selectAllBoard";
		List<CustomerBoard> results = sqlSession.selectList(stmt);
		logger.trace(""+results);
		return results;
	}

	@Override
	public List<CustomerBoard> getAllBoardWithComments() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCustomerBoard(CustomerBoard board) {
		// TODO Auto-generated method stub
		return 0;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerBoard getBoardByBoardIdWithComments(int boardId) {
		// TODO Auto-generated method stub
		return null;
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
