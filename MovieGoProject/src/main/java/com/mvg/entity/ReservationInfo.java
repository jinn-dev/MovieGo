package com.mvg.entity;



public class ReservationInfo {
	private int reservationinfoId;
	private int seatId;
	private int reservationId;

	public ReservationInfo() {
	}

	public ReservationInfo(int reservationinfoId, int seatId, int reservationId) {
		super();
		this.reservationinfoId = reservationinfoId;
		this.seatId = seatId;
		this.reservationId = reservationId;
	}

	public int getReservationinfoId() {
		return reservationinfoId;
	}

	public void setReservationinfoId(int reservationinfoId) {
		this.reservationinfoId = reservationinfoId;
	}

	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	@Override
	public String toString() {
		return "ReservationInfo [reservationinfoId=" + reservationinfoId
				+ ", seatId=" + seatId + ", reservationId=" + reservationId
				+ "]";
	}

}
