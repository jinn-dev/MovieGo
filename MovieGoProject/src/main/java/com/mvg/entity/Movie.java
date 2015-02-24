package com.mvg.entity;

public class Movie {

	private String movieCode;
	private String movieTitleKr;
	private String movieTitleEng;
	private String movieGenre;
	private String movieNation;
	private String movieDirector;
	private String movieActor1;
	private String movieActor2;
	private String movieActor3;
	private String movieActor4;
	private String movieImgUrl;
	private String movieStory;
	private String movieOpenDate;
	int count; // 장르 통계낼때 필요 ㅠㅠ

	public Movie() {
	}

	public Movie(String movieCode, String movieTitleKr, String movieTitleEng,
			String movieGenre, String movieNation, String movieDirector,
			String movieActor1, String movieActor2, String movieActor3,
			String movieActor4, String movieImgUrl, String movieStory,
			String movieOpenDate, int count) {
		super();
		this.movieCode = movieCode;
		this.movieTitleKr = movieTitleKr;
		this.movieTitleEng = movieTitleEng;
		this.movieGenre = movieGenre;
		this.movieNation = movieNation;
		this.movieDirector = movieDirector;
		this.movieActor1 = movieActor1;
		this.movieActor2 = movieActor2;
		this.movieActor3 = movieActor3;
		this.movieActor4 = movieActor4;
		this.movieImgUrl = movieImgUrl;
		this.movieStory = movieStory;
		this.movieOpenDate = movieOpenDate;
		this.count = count;
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

	public String getMovieNation() {
		return movieNation;
	}

	public void setMovieNation(String movieNation) {
		this.movieNation = movieNation;
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

	public String getMovieActor4() {
		return movieActor4;
	}

	public void setMovieActor4(String movieActor4) {
		this.movieActor4 = movieActor4;
	}

	public String getMovieImgUrl() {
		return movieImgUrl;
	}

	public void setMovieImgUrl(String movieImgUrl) {
		this.movieImgUrl = movieImgUrl;
	}

	public String getMovieStory() {
		return movieStory;
	}

	public void setMovieStory(String movieStory) {
		this.movieStory = movieStory;
	}

	public String getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(String movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Movie [movieCode=" + movieCode + ", movieTitleKr="
				+ movieTitleKr + ", movieTitleEng=" + movieTitleEng
				+ ", movieGenre=" + movieGenre + ", movieNation=" + movieNation
				+ ", movieDirector=" + movieDirector + ", movieActor1="
				+ movieActor1 + ", movieActor2=" + movieActor2
				+ ", movieActor3=" + movieActor3 + ", movieActor4="
				+ movieActor4 + ", movieImgUrl=" + movieImgUrl
				+ ", movieStory=" + movieStory + ", movieOpenDate="
				+ movieOpenDate + ", count=" + count + "]";
	}

}
