package com.mvg.entity;

public class ReservationByUser {

	private int reservationId;
	private String theaterName;
	private String movieName;
	private String reservationDate;
	private String movieTime;
	private int reservationPrice;
	private String cancel;

	public ReservationByUser() {
	}

	public ReservationByUser(int reservationId, String theaterName, String movieName,
			String reservationDate, String movieTime, int reservationPrice) {
		super();
		this.reservationId = reservationId;
		this.theaterName = theaterName;
		this.movieName = movieName;
		this.reservationDate = reservationDate;
		this.movieTime = movieTime;
		this.reservationPrice = reservationPrice;
		this.cancel = "n";
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
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

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	@Override
	public String toString() {
		return "ReservationByUser [reservationId=" + reservationId
				+ ", theaterName=" + theaterName + ", movieName=" + movieName
				+ ", reservationDate=" + reservationDate + ", movieTime="
				+ movieTime + ", reservationPrice=" + reservationPrice
				+ ", cancel=" + cancel + "]";
	}
	

}
