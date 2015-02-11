package com.mvg.entity;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Comment {

	private int commentId;
	private int boardId;
	private String commentContent;
	private Date commentDate;

	public Comment() {}
	
	public Comment(int commentId, int boardId, String commentContent,
			Date commentDate) {
		super();
		this.commentId = commentId;
		this.boardId = boardId;
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
				+ ", commentContent=" + commentContent + ", commentDate="
				+ commentDate + "]";
	}

}
