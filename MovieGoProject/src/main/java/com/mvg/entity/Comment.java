package com.mvg.entity;

import java.util.Date;


public class Comment {

	private int commentId;
	private int boardId;
	private String userId;
	private String commentContent;
	private Date commentDate;

	public Comment(){}

	public Comment(int commentId, int boardId, String userId,
			String commentContent, Date commentDate) {
		super();
		this.commentId = commentId;
		this.boardId = boardId;
		this.userId = userId;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
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

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", boardId=" + boardId
				+ ", userId=" + userId + ", commentContent=" + commentContent
				+ ", commentDate=" + commentDate + "]";
	}
	
	
	

}
