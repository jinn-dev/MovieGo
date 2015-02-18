package com.mvg.entity;

import org.springframework.stereotype.Repository;

public class SeatInfo {

	private int seatId;
	private int nowmovieId;
	private int seatNo;

	public SeatInfo() {}
	
	public SeatInfo(int seatId, int nowmovieId, int seatNo) {
		super();
		this.seatId = seatId;
		this.nowmovieId = nowmovieId;
		this.seatNo = seatNo;
	}

	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	public int getNowmovieId() {
		return nowmovieId;
	}

	public void setNowmovieId(int nowmovieId) {
		this.nowmovieId = nowmovieId;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	@Override
	public String toString() {
		return "SeatInfo [seatId=" + seatId + ", nowmovieId=" + nowmovieId
				+ ", seatNo=" + seatNo + "]";
	}

}
