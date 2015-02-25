package com.mvg.entity;

public class CancellationByUser {
	
	private int cancelId;
	private String theaterName;
	private String movieName;
	private String movieTime;
	private String cancelDate;

	public CancellationByUser() {

	}

	public CancellationByUser(int cancelId, String theaterName,
			String movieName, String movieTime, String cancelDate) {
		super();
		this.cancelId = cancelId;
		this.theaterName = theaterName;
		this.movieName = movieName;
		this.movieTime = movieTime;
		this.cancelDate = cancelDate;
	}

	public int getCancelId() {
		return cancelId;
	}

	public void setCancelId(int cancelId) {
		this.cancelId = cancelId;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieTime() {
		return movieTime;
	}

	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	@Override
	public String toString() {
		return "CancellationByUser [cancelId=" + cancelId + ", theaterName="
				+ theaterName + ", movieName=" + movieName + ", movieTime="
				+ movieTime + ", cancelDate=" + cancelDate + "]";
	}

	
}
