package com.mvg.entity;

import java.util.ArrayList;
import java.util.Date;


public class Reservation {

	private int reservationId;
	private String userId;
	private int reservationNum;
	private int reservationPrice;
	private Date reservationDate;
	private ArrayList<ReservationInfo> reservationInfo;
	
	public Reservation() {
	}

	public Reservation(String userId, int reservationNum,
			int reservationPrice) {
		super();
		this.userId = userId;
		this.reservationNum = reservationNum;
		this.reservationPrice = reservationPrice;
	}
	
	public ArrayList<ReservationInfo> getReservationInfo() {
		return reservationInfo;
	}
	
	public void setReservationInfo(ArrayList<ReservationInfo> reservationInfo) {
		this.reservationInfo = reservationInfo;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId + ", userId="
				+ userId + ", reservationNum=" + reservationNum
				+ ", reservationPrice=" + reservationPrice
				+ ", reservationDate=" + reservationDate + ", reservationInfo="
				+ reservationInfo + "]";
	}
	
	

}
