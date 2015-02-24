package com.mvg.entity;

public class ReservationByUser {

	private String theaterName;
	private String movieName;
	private String reservationDate;
	private String movieTime;
	private int reservationPrice;

	public ReservationByUser() {
	}

	public ReservationByUser(String theaterName, String movieName,
			String reservationDate, String movieTime, int reservationPrice) {
		super();
		this.theaterName = theaterName;
		this.movieName = movieName;
		this.reservationDate = reservationDate;
		this.movieTime = movieTime;
		this.reservationPrice = reservationPrice;
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

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getMovieTime() {
		return movieTime;
	}

	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}

	public int getReservationPrice() {
		return reservationPrice;
	}

	public void setReservationPrice(int reservationPrice) {
		this.reservationPrice = reservationPrice;
	}

	@Override
	public String toString() {
		return "ReservationByUser [theaterName=" + theaterName + ", movieName="
				+ movieName + ", reservationDate=" + reservationDate
				+ ", movieTime=" + movieTime + ", reservationPrice="
				+ reservationPrice + "]";
	}

}
