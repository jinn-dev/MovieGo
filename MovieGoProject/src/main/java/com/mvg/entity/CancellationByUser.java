package com.mvg.entity;

public class CancellationByUser {

	private String theaterName;
	private String movieName;
	private String movieTime;
	private String cancelDate;
	private String cancelPrice;

	public CancellationByUser() {

	}

	public CancellationByUser(String theaterName, String movieName,
			String movieTime, String cancelDate, String cancelPrice) {
		super();
		this.theaterName = theaterName;
		this.movieName = movieName;
		this.movieTime = movieTime;
		this.cancelDate = cancelDate;
		this.cancelPrice = cancelPrice;
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

	public String getCancelPrice() {
		return cancelPrice;
	}

	public void setCancelPrice(String cancelPrice) {
		this.cancelPrice = cancelPrice;
	}

	@Override
	public String toString() {
		return "CancellationByUser [theaterName=" + theaterName
				+ ", movieName=" + movieName + ", movieTime=" + movieTime
				+ ", cancelDate=" + cancelDate + ", cancelPrice=" + cancelPrice
				+ "]";
	}

}
