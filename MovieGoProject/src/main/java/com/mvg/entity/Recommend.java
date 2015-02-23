package com.mvg.entity;

public class Recommend {
	
	String movieGenre;
	int genreCount;
	
	
	public Recommend(){};
	
	public Recommend(String movieGenre, int genreCount) {
		super();
		this.movieGenre = movieGenre;
		this.genreCount = genreCount;
	}

	public String getMovieGenre() {
		return movieGenre;
	}

	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}

	public int getGenreCount() {
		return genreCount;
	}

	public void setGenreCount(int genreCount) {
		this.genreCount = genreCount;
	}

	@Override
	public String toString() {
		return "Recommendation [movieGenre=" + movieGenre + ", genreCount="
				+ genreCount + "]";
	}

	
}
