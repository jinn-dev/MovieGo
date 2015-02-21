package com.mvg.entity;

public class Evaluation {

	private int evId;
	private String userId;
	private String movieCode;
	private int evRating;
	private String evComment;

	public Evaluation() {}
	public Evaluation(String userId, String movieCode, int evRating) {
		super();
		this.userId = userId;
		this.movieCode = movieCode;
		this.evRating = evRating;
	}
	
	public Evaluation(int evId, String userId, String movieCode, int evRating) {
		super();
		this.evId = evId;
		this.userId = userId;
		this.movieCode = movieCode;
		this.evRating = evRating;
	}
	public Evaluation(int evId, String userId, String movieCode, int evRating,
			String evComment) {
		super();
		this.evId = evId;
		this.userId = userId;
		this.movieCode = movieCode;
		this.evRating = evRating;
		this.evComment = evComment;
	}

	
	public int getEvId() {
		return evId;
	}

	public void setEvId(int evId) {
		this.evId = evId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMovieCode() {
		return movieCode;
	}

	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}

	public int getEvRating() {
		return evRating;
	}

	public void setEvRating(int evRating) {
		this.evRating = evRating;
	}

	public String getEvComment() {
		return evComment;
	}

	public void setEvComment(String evComment) {
		this.evComment = evComment;
	}

	@Override
	public String toString() {
		return "Evaluation [evId=" + evId + ", userId=" + userId
				+ ", movieCode=" + movieCode + ", evRating=" + evRating
				+ ", evComment=" + evComment + "]";
	}

}
