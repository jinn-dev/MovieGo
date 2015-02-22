package com.mvg.service;

import java.util.List;

import com.mvg.entity.CustomerBoard;

public interface CustomerBoardService {

	List<CustomerBoard> getAllBoardList();

	int getBoardCnt();
	
	int addBoard(CustomerBoard board);
	
	int modifyBoard(CustomerBoard board);
	
	void deleteBoard(int boardId);
	
	void deleteBoardByUserId(String userId);

	CustomerBoard getBoardByBdId(int boardId);
	
	CustomerBoard getBoardByBdIdWithCmts(int boardId);

}
