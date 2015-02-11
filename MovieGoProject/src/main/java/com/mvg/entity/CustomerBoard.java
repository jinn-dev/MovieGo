package com.mvg.entity;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class CustomerBoard {

	private int boardId;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;

	public CustomerBoard() {}
	
	public CustomerBoard(int boardId, String userId, String boardTitle,
			String boardContent, Date boardDate) {
		super();
		this.boardId = boardId;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	@Override
	public String toString() {
		return "CustomerBoard [boardId=" + boardId + ", userId=" + userId
				+ ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardDate=" + boardDate + "]";
	}

}
