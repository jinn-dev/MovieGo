package com.mvg.entity;

import org.springframework.stereotype.Repository;

@Repository
public class Theater {

	private int theaterId;
	private String theaterName;

	public Theater() {}
	
	public Theater(int theaterNumber, String theaterName) {
		super();
		this.theaterId = theaterNumber;
		this.theaterName = theaterName;
	}

	public int getTheaterNumber() {
		return theaterId;
	}

	public void setTheaterNumber(int theaterNumber) {
		this.theaterId = theaterNumber;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	@Override
	public String toString() {
		return "Theater [theaterNumber=" + theaterId + ", theaterName="
				+ theaterName + "]";
	}

}
