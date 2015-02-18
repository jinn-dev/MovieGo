package com.mvg.entity;

import java.util.Date;


public class NowMovie {
	private int nowmovieId;
	private int theaterId;
	private String movieCode;
	private Date movieDate;

	public NowMovie() {}
	
	public NowMovie(int nowmovieId, int theaterId, String movieCode,
			Date movieDate) {
		super();
		this.nowmovieId = nowmovieId;
		this.theaterId = theaterId;
		this.movieCode = movieCode;
		this.movieDate = movieDate;
	}

	public int getNowmovieId() {
		return nowmovieId;
	}

	public void setNowmovieId(int nowmovieId) {
		this.nowmovieId = nowmovieId;
	}

	public int getTheaterId() {
		return theaterId;
	}

	public void setTheaterId(int theaterId) {
		this.theaterId = theaterId;
	}

	public String getMovieCode() {
		return movieCode;
	}

	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}

	public Date getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}

	@Override
	public String toString() {
		return "NowMovie [nowmovieId=" + nowmovieId + ", theaterId="
				+ theaterId + ", movieCode=" + movieCode + ", movieDate="
				+ movieDate + "]";
	}

}
