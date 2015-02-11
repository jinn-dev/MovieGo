package com.mvg.entity;

import org.springframework.stereotype.Repository;

@Repository
public class ReservationInfo {
	private int reservationinfoId;
	private int seatId;
	private String userId;
	private int reservationId;

	public ReservationInfo() {}
	
	public ReservationInfo(int reservationinfoId, int seatId, String userId,
			int reservationId) {
		super();
		this.reservationinfoId = reservationinfoId;
		this.seatId = seatId;
		this.userId = userId;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
				+ ", seatId=" + seatId + ", userId=" + userId
				+ ", reservationId=" + reservationId + "]";
	}

}
