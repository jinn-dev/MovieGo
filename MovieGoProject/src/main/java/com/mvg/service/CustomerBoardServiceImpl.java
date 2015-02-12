package com.mvg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.CustomerBoardDao;
import com.mvg.entity.CustomerBoard;

@Service
public class CustomerBoardServiceImpl implements CustomerBoardService {

	@Autowired
	CustomerBoardDao dao;
	
	@Override
	public List<CustomerBoard> getAllBoardList() {
		List<CustomerBoard> results = dao.getAllBoard();
		return results;
	}

	@Override
	public int addBoard(CustomerBoard board) {
		int result = dao.insertCustomerBoard(board);
		return result;
	}
	
	@Override
	public int modifyBoard(CustomerBoard board) {
		int result = dao.updateCustomerBoard(board);
		return result;
	}
	
	@Override
	public void deleteBoard(int boardId) {
		dao.deleteCustomerBoard(boardId);
	}

	@Override
	public CustomerBoard getBoardByBdIdWithCmts(int boardId) {
		CustomerBoard result = dao.getBoardByBoardIdWithComments(boardId);
		return result;
	}

	@Override
	public CustomerBoard getBoardByBdId(int boardId) {
		CustomerBoard result = dao.getBoardByBoardId(boardId);
		return result;
	}


	
	// 게시글 수정, 게시글 삭제, 게시글 검색

}
