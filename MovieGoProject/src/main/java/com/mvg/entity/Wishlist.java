package com.mvg.entity;

import org.springframework.stereotype.Repository;

@Repository
public class Wishlist {

	private int wishId;
	private String userId;
	private String movieCode;

	public Wishlist() {}

	
	public Wishlist(int wishId, String userId, String movieCode) {
		super();
		this.wishId = wishId;
		this.userId = userId;
		this.movieCode = movieCode;
	}

	public int getWishId() {
		return wishId;
	}

	public void setWishId(int wishId) {
		this.wishId = wishId;
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

	@Override
	public String toString() {
		return "Wishlist [wishId=" + wishId + ", userId=" + userId
				+ ", movieCode=" + movieCode + "]";
	}

}
