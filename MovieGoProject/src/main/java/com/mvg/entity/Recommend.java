package com.mvg.entity;

public class Recommend {
	
	String movieGenre;
	String movieNation;
	int count;
	
	
	public Recommend(){}


	public Recommend(String movieGenre, String movieNation, int count) {
		super();
		this.movieGenre = movieGenre;
		this.movieNation = movieNation;
		this.count = count;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "Recommend [movieGenre=" + movieGenre + ", movieNation="
				+ movieNation + ", count=" + count + "]";
	};
	

	
}
