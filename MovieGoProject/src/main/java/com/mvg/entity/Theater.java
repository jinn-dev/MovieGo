package com.mvg.entity;

import org.springframework.stereotype.Repository;

@Repository
public class Theater {

	private int theaterNumber;
	private String theaterName;

	public Theater(int theaterNumber, String theaterName) {
		super();
		this.theaterNumber = theaterNumber;
		this.theaterName = theaterName;
	}

	public int getTheaterNumber() {
		return theaterNumber;
	}

	public void setTheaterNumber(int theaterNumber) {
		this.theaterNumber = theaterNumber;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	@Override
	public String toString() {
		return "Theater [theaterNumber=" + theaterNumber + ", theaterName="
				+ theaterName + "]";
	}

}
