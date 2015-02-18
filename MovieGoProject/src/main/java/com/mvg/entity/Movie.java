package com.mvg.entity;

import org.springframework.stereotype.Repository;

public class Movie {

	private String movieCode;
	private String movieTitleKr;
	private String movieTitleEng;
	private String movieGenre;
	private String movieDirector;
	private String movieActor1;
	private String movieActor2;
	private String movieActor3;
	private String movieImgUrl;

	public Movie() {}
	
	public Movie(String movieCode, String movieTitleKr, String movieTitleEng,
			String movieGenre, String movieDirector, String movieActor1,
			String movieImgUrl) {
		super();
		this.movieCode = movieCode;
		this.movieTitleKr = movieTitleKr;
		this.movieTitleEng = movieTitleEng;
		this.movieGenre = movieGenre;
		this.movieDirector = movieDirector;
		this.movieActor1 = movieActor1;
		this.movieImgUrl = movieImgUrl;
	}

	public Movie(String movieCode, String movieTitleKr, String movieTitleEng,
			String movieGenre, String movieDirector, String movieActor1,
			String movieActor2, String movieImgUrl) {
		this(movieCode, movieTitleKr, movieTitleEng, movieGenre, movieDirector,
				movieActor1, movieImgUrl);
		this.movieActor2 = movieActor2;
	}

	public Movie(String movieCode, String movieTitleKr, String movieTitleEng,
			String movieGenre, String movieDirector, String movieActor1,
			String movieActor2, String movieActor3, String movieImgUrl) {
		this(movieCode, movieTitleKr, movieTitleEng, movieGenre, movieDirector,
				movieActor1, movieActor2, movieImgUrl);
		this.movieActor3 = movieActor3;
	}

	public String getMovieCode() {
		return movieCode;
	}

	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}

	public String getMovieTitleKr() {
		return movieTitleKr;
	}

	public void setMovieTitleKr(String movieTitleKr) {
		this.movieTitleKr = movieTitleKr;
	}

	public String getMovieTitleEng() {
		return movieTitleEng;
	}

	public void setMovieTitleEng(String movieTitleEng) {
		this.movieTitleEng = movieTitleEng;
	}

	public String getMovieGenre() {
		return movieGenre;
	}

	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public String getMovieActor1() {
		return movieActor1;
	}

	public void setMovieActor1(String movieActor1) {
		this.movieActor1 = movieActor1;
	}

	public String getMovieActor2() {
		return movieActor2;
	}

	public void setMovieActor2(String movieActor2) {
		this.movieActor2 = movieActor2;
	}

	public String getMovieActor3() {
		return movieActor3;
	}

	public void setMovieActor3(String movieActor3) {
		this.movieActor3 = movieActor3;
	}

	public String getMovieImgUrl() {
		return movieImgUrl;
	}

	public void setMovieImgUrl(String movieImgUrl) {
		this.movieImgUrl = movieImgUrl;
	}

	@Override
	public String toString() {
		return "Movie [movieCode=" + movieCode + ", movieTitleKr="
				+ movieTitleKr + ", movieTitleEng=" + movieTitleEng
				+ ", movieGenre=" + movieGenre + ", movieDirector="
				+ movieDirector + ", movieActor1=" + movieActor1
				+ ", movieActor2=" + movieActor2 + ", movieActor3="
				+ movieActor3 + ", movieImgUrl=" + movieImgUrl + "]";
	}

}
