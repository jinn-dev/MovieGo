package com.mvg.entity;

import java.util.Date;


public class Cancellation {
	private int cancelId;
	private Date cancelDate;
	private String userId;
	private int seatId;

	public Cancellation() {}
	
	public Cancellation(int cancelId, Date cancelDate, String userId, int seatId) {
		super();
		this.cancelId = cancelId;
		this.cancelDate = cancelDate;
		this.userId = userId;
		this.seatId = seatId;
	}

	public int getCancelId() {
		return cancelId;
	}

	public void setCancelId(int cancelId) {
		this.cancelId = cancelId;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	@Override
	public String toString() {
		return "Cancellation [cancelId=" + cancelId + ", cancelDate="
				+ cancelDate + ", userId=" + userId + ", seatId=" + seatId
				+ "]";
	}

}
