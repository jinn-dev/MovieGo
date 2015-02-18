package com.mvg.entity;

import java.util.ArrayList;


public class Wishlist {

	private int wishId;
	private String userId;
	private String movieCode;
	private ArrayList<Movie> movies;
	public Wishlist() {}

	
	public ArrayList<Movie> getMovies() {
		return movies;
	}


	public void setMovies(ArrayList<Movie> movies) {
		this.movies = movies;
	}


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
				+ ", movieCode=" + movieCode + ", movies=" + movies + "]";
	}

}
