package com.mvg.service;

import java.util.List;

import com.mvg.entity.CustomerBoard;

public interface CustomerBoardService {

	List<CustomerBoard> getAllBoardList();

	int addBoard(CustomerBoard board);
	
	int modifyBoard(CustomerBoard board);
	
	CustomerBoard getBoardByBdId(int boardId);
	
	CustomerBoard getBoardByBdIdWithCmts(int boardId);
}
