package com.mvg.dao;

import java.util.List;

import com.mvg.entity.CustomerBoard;

public interface CustomerBoardDao {
	
	//모든 게시글의 수
	int getAllBoardCount();
	
	//게시글 모두
	List<CustomerBoard> getAllBoard();
	
	//게시글 모두 + 댓글 포함
	// List<CustomerBoard> getAllBoardWithComments();
	
	//게시글 등록
	int insertCustomerBoard(CustomerBoard board);
	
	//게시글 수정
	int updateCustomerBoard(CustomerBoard board);
	
	//게시글 삭제..impl안에서 댓글 먼저 삭제
	void deleteCustomerBoard(int boardId);
	
	void deleteCustomerBoardByUserId(String userId);

	//게시글 하나 가져오기
	CustomerBoard getBoardByBoardId(int boardId);
	
	//게시글 하나 가져오기 + 댓글
	CustomerBoard getBoardByBoardIdWithComments(int boardId);
	
	//내가쓴 게시물 가져오기
	List<CustomerBoard> getBoardByUserId(String userId);
	
	//내가쓴 게시물 가져오기+댓글
	// List<CustomerBoard> getBoardByUserIdWithComments(String userId);
	
}
