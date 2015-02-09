package com.mvg.entity;

import org.springframework.stereotype.Repository;

@Repository
public class Reservation {

	private int reservationId;
	private int reservationNum;
	private int reservationPrice;

	public Reservation(int reservationId, int reservationNum,
			int reservationPrice) {
		super();
		this.reservationId = reservationId;
		this.reservationNum = reservationNum;
		this.reservationPrice = reservationPrice;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public int getReservationNum() {
		return reservationNum;
	}

	public void setReservationNum(int reservationNum) {
		this.reservationNum = reservationNum;
	}

	public int getReservationPrice() {
		return reservationPrice;
	}

	public void setReservationPrice(int reservationPrice) {
		this.reservationPrice = reservationPrice;
	}

	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId
				+ ", reservationNum=" + reservationNum + ", reservationPrice="
				+ reservationPrice + "]";
	}

}
